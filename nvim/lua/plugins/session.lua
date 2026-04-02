return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		init = function()
			vim.api.nvim_create_autocmd("VimEnter", {
				nested = true,
				callback = function()
					if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
						vim.schedule(function()
							require("persistence").load()
						end)
					end
				end,
			})
		end,
		keys = {
			{ "<leader>qs", function() require("persistence").load() end, desc = "Restore session" },
			{ "<leader>qS", function() require("persistence").select() end, desc = "Select session" },
			{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Last session" },
			{ "<leader>qd", function() require("persistence").stop() end, desc = "Stop persistence" },
		},
	},
}
