return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-- Picker
		{ "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart picker" },
		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
		{ "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
		{ "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader><space>", function() Snacks.picker.files() end, desc = "Find files" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Search keymaps" },
		{ "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>fc", function() Snacks.picker.files({ dirs = { vim.fn.expand("~/.claude") } }) end, desc = "Grep Claude plans" },
		{ "<leader>fp", function() Snacks.picker.grep({ dirs = { vim.fn.expand("~/.claude") } }) end, desc = "Grep Claude plans" },

		-- Git
		{ "<leader>gf", function() Snacks.picker.git_files() end, desc = "Git files" },
		{ "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git commits" },
		{ "<leader>gC", function() Snacks.picker.git_log({ current_file = true }) end, desc = "Git commits (file)" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },

		-- Explorer
		{ "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },

		-- UI
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },
		{ "<leader>uN", function() Snacks.notifier.show_history() end, desc = "Notification history" },
		{ "<leader>us", function() Snacks.toggle.option("spell"):toggle() end, desc = "Toggle spelling" },
		{ "<leader>uw", function() Snacks.toggle.option("wrap"):toggle() end, desc = "Toggle wrap" },
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
		{ "<leader>z", function() Snacks.zen.zoom() end, desc = "Zoom window" },
	},
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = {
			enabled = true,
			actions = {
				toggle_hidden_ignored = function(picker)
					picker.opts.hidden = not picker.opts.hidden
					picker.opts.ignored = not picker.opts.ignored
					picker.list:set_target()
					picker:find()
				end,
			},
			win = {
				input = {
					keys = {
						["<a-i>"] = { "toggle_hidden_ignored", mode = { "i", "n" } },
					},
				},
				list = {
					keys = {
						["<a-i>"] = "toggle_hidden_ignored",
					},
				},
			},
			sources = {
				explorer = {
					auto_close = true,
					layout = { preset = "default", fullscreen = true, preview = true },
					win = {
						list = {
							keys = {
								["<a-i>"] = "toggle_hidden_ignored",
							},
							wo = {
								relativenumber = true,
							},
						},
					},
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		words = { enabled = true },
	},
}
