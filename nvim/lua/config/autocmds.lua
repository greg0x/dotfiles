local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Resize splits on window resize
autocmd("VimResized", {
  group = augroup("resize_splits", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
  group = augroup("last_loc", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some filetypes with q
autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = { "help", "lspinfo", "man", "notify", "qf", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file
autocmd("BufWritePre", {
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Markdown file settings
autocmd("FileType", {
  group = augroup("markdown_settings", { clear = true }),
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    -- Highlight bare URLs
    vim.fn.matchadd("@markup.link.url", "https\\?://[^ )>\"'`]*")
  end,
})

-- Convert "description https://url" to markdown links on save
autocmd("BufWritePre", {
  group = augroup("markdown_linkify", { clear = true }),
  pattern = { "*.md" },
  callback = function()
    -- Extract a nice title from URL (e.g., repo name from GitHub)
    local function url_to_title(url)
      -- GitHub: github.com/user/repo -> repo
      -- GitHub issues/PRs: github.com/user/repo/issues/123 -> repo#123
      local user, repo, type, num = url:match("github%.com/([^/]+)/([^/]+)/(%w+)/(%d+)")
      if repo and type and num then
        if type == "issues" or type == "pull" then
          return repo .. "#" .. num
        end
      end
      local _, repo_only = url:match("github%.com/([^/]+)/([^/]+)/?$")
      if repo_only then
        return repo_only
      end
      -- Fallback: last meaningful path segment or full URL
      local last_segment = url:match("/([^/]+)/?$")
      if last_segment and not last_segment:match("^%d+$") and #last_segment > 1 then
        return last_segment
      end
      return url
    end

    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local changed = false
    for i, line in ipairs(lines) do
      local prefix, desc, url

      -- Try bullet + description + URL
      prefix, desc, url = line:match("^(%s*[%-%*]%s+)([^%[%]%(%)]+)%s+(https?://[^%s]+)$")
      if not desc then
        -- Try without bullet (desc must not start with bullet)
        prefix, desc, url = line:match("^(%s*)([^%[%]%(%)%-%*][^%[%]%(%)]*)%s+(https?://[^%s]+)$")
      end
      if not desc then
        -- Try bullet + URL only (no description)
        prefix, url = line:match("^(%s*[%-%*]%s+)(https?://[^%s]+)$")
        if url then
          desc = url_to_title(url)
        end
      end
      if not desc then
        -- Try bare URL only (no bullet, no description)
        prefix, url = line:match("^(%s*)(https?://[^%s]+)$")
        if url then
          desc = url_to_title(url)
        end
      end

      if desc and url and desc:match("%S") then
        desc = desc:gsub("%s+$", "") -- trim trailing space
        lines[i] = string.format("%s[%s](%s)", prefix or "", desc, url)
        changed = true
      end
    end
    if changed then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end
  end,
})

-- Autosave on focus lost or buffer leave
autocmd({ "FocusLost", "BufLeave" }, {
  group = augroup("autosave", { clear = true }),
  pattern = "*",
  callback = function(event)
    local buf = event.buf
    if vim.api.nvim_buf_is_valid(buf)
      and vim.bo[buf].modified
      and vim.bo[buf].buftype == ""
      and vim.api.nvim_buf_get_name(buf) ~= ""
    then
      vim.api.nvim_buf_call(buf, function()
        -- Format then save
        local ok, conform = pcall(require, "conform")
        if ok then
          conform.format({ bufnr = buf, timeout_ms = 500, lsp_fallback = true })
        end
        vim.cmd("update")
      end)
    end
  end,
})
