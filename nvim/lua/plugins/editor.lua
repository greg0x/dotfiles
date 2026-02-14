return {
	-- Autopairs
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		opts = {},
	},

	-- Surround motions (ys, ds, cs)
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "sa", -- Add surrounding
				delete = "sd", -- Delete surrounding
				replace = "sr", -- Replace surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				update_n_lines = "sn", -- Update `n_lines`
			},
		},
	},

	-- Comments (gc)
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {},
	},

	-- Better text objects (around/inside)
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {
			n_lines = 500,
		},
	},

	-- Flash for fast navigation
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	-- TODO comments
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Prev todo",
			},
			{ "<leader>ft", "<cmd>TodoQuickFix<cr>", desc = "Find todos" },
		},
	},

	-- Harpoon for quick file navigation
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon add",
			},
			{
				"<leader>hh",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
				desc = "Harpoon menu",
			},
			{
				"<leader>1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon 1",
			},
			{
				"<leader>2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon 2",
			},
			{
				"<leader>3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon 3",
			},
			{
				"<leader>4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon 4",
			},
			{
				"<leader>5",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "Harpoon 5",
			},
			{
				"<leader>6",
				function()
					require("harpoon"):list():select(6)
				end,
				desc = "Harpoon 6",
			},
		},
		config = function()
			require("harpoon"):setup()
		end,
	},

	-- Trouble for better diagnostics
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols" },
			{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },
		},
		opts = {},
	},

	-- Grug-far for find and replace
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		keys = {
			{
				"<leader>fR",
				function()
					require("grug-far").open()
				end,
				desc = "Find and replace",
			},
			{
				"<leader>fR",
				function()
					require("grug-far").with_visual_selection()
				end,
				desc = "Find and replace (selection)",
				mode = "v",
			},
		},
		opts = {},
	},

	-- Render markdown nicely
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			link = {
				enabled = true,
				hyperlink = "󰌹 ", -- icon for URLs
				custom = {
					web = { pattern = "^http", icon = "󰖟 " },
				},
			},
		},
		keys = {
			{
				"gx",
				function()
					local line = vim.api.nvim_get_current_line()
					local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- 1-indexed

					-- Find all markdown links [text](url) with positions
					local links = {}
					local pos = 1
					while true do
						local s, e, url = line:find("%[.-%]%((.-)%)", pos)
						if not s then
							break
						end
						table.insert(links, { start = s, finish = e, url = url })
						pos = e + 1
					end

					-- Find all bare URLs with positions
					pos = 1
					while true do
						local s, e, url = line:find("(https?://[^%s%)%]]+)", pos)
						if not s then
							break
						end
						-- Skip if inside a markdown link
						local dominated = false
						for _, link in ipairs(links) do
							if s >= link.start and e <= link.finish then
								dominated = true
								break
							end
						end
						if not dominated then
							table.insert(links, { start = s, finish = e, url = url })
						end
						pos = e + 1
					end

					if #links == 0 then
						return
					end

					-- If only one link, open it
					if #links == 1 then
						vim.ui.open(links[1].url)
						return
					end

					-- Multiple links: find the one under cursor
					for _, link in ipairs(links) do
						if col >= link.start and col <= link.finish then
							vim.ui.open(link.url)
							return
						end
					end

					-- Fallback: open first link
					vim.ui.open(links[1].url)
				end,
				ft = "markdown",
				desc = "Open link",
			},
		},
	},

	-- Show marks in signcolumn and highlight marked lines
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {
			default_mappings = true,
			signs = true,
			highlight_line = true,
		},
	},
}
