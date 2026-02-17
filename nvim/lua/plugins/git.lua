return {
	-- Gitsigns for inline git info
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 300,
				virt_text_pos = "eol",
			},
			current_line_blame_formatter = "<author>, <author_time:%R> • <summary>",
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns
				local map = function(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]h", gs.next_hunk, "Next hunk")
				map("n", "[h", gs.prev_hunk, "Prev hunk")
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
				map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>ghd", gs.diffthis, "Diff this")
				map("n", "<leader>ghb", gs.blame_line, "Blame line (full)")
				map("n", "<leader>ghB", function()
					gs.blame_line({ full = true })
				end, "Blame line (popup)")
			end,
		},
	},

	-- Open commits/PRs in browser
	{
		"ruifm/gitlinker.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>gy",
				function()
					require("gitlinker").get_buf_range_url("n")
				end,
				desc = "Copy GitHub URL",
			},
			{
				"<leader>gY",
				function()
					require("gitlinker").get_buf_range_url(
						"n",
						{ action_callback = require("gitlinker.actions").open_in_browser }
					)
				end,
				desc = "Open in GitHub",
			},
		},
		opts = {},
	},

	-- Octo for GitHub PRs
	{
		dir = "~/dev/devenv/octo.nvim",
		cmd = "Octo",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>go", "<cmd>Octo<cr>", desc = "Octo" },

			-- Issues
			{ "<leader>gil", "<cmd>Octo issue list<cr>", desc = "List issues" },
			{ "<leader>gic", "<cmd>Octo issue create<cr>", desc = "Create issue" },
			{ "<leader>gis", "<cmd>Octo issue search<cr>", desc = "Search issues" },
			{ "<leader>gim", "<cmd>Octo issue list mentioned=greg0x<cr>", desc = "Issues mentioning me" },

			-- Pull requests
			{ "<leader>gpl", "<cmd>Octo pr list<cr>", desc = "List PRs" },
			{ "<leader>gpc", "<cmd>Octo pr create<cr>", desc = "Create PR" },
			{ "<leader>gps", "<cmd>Octo pr search<cr>", desc = "Search PRs" },

			-- Milestones
			{ "<leader>gml", "<cmd>Octo milestone list<cr>", desc = "List milestones" },

			-- Notifications
			{ "<leader>gn", "<cmd>Octo notification list<cr>", desc = "Notifications" },
		},
		opts = {
			enable_builtin = true,
			default_to_projects_v2 = true,
			picker = "snacks",
			issues = {
				order_by = {
					field = "UPDATED_AT",
					direction = "DESC",
				},
			},
		},
	},
}
