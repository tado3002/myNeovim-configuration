local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
	return
end

local board = {
	[[                                                                                                        ]],
	[[████████╗██████╗ ██╗  ██╗   ███████╗ ██████╗██╗  ██╗██╗    ██╗ █████╗ ██████╗ ███████╗███████╗███╗   ██╗]],
	[[╚══██╔══╝██╔══██╗██║  ██║   ██╔════╝██╔════╝██║  ██║██║    ██║██╔══██╗██╔══██╗╚══███╔╝██╔════╝████╗  ██║]],
	[[   ██║   ██║  ██║███████║   ███████╗██║     ███████║██║ █╗ ██║███████║██████╔╝  ███╔╝ █████╗  ██╔██╗ ██║]],
	[[   ██║   ██║  ██║██╔══██║   ╚════██║██║     ██╔══██║██║███╗██║██╔══██║██╔══██╗ ███╔╝  ██╔══╝  ██║╚██╗██║]],
	[[   ██║   ██████╔╝██║  ██║██╗███████║╚██████╗██║  ██║╚███╔███╔╝██║  ██║██║  ██║███████╗███████╗██║ ╚████║]],
	[[   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝]],
	[[                                                                                                        ]],
}

local data_exists, custom_dasboard = pcall(require, "custom.dashboard")
if data_exists then
	if type(custom_dasboard) == "table" then
		local data_board = custom_dasboard.dashboard
		if data_board ~= nil then
			board = data_board
		end
	end
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = board
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("z", "鈴 Lazy", ":Lazy<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "Muhammad Murtadlo"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

-- dashboard pertama
-- local status_ok, db = pcall(require, "dashboard")
-- if not status_ok then
-- 	return
-- end
--
-- opts = {
-- 	theme = "hyper",
-- 	config = {
-- 		header = {
-- 			[[                                                                                                        ]],
-- 			[[████████╗██████╗ ██╗  ██╗   ███████╗ ██████╗██╗  ██╗██╗    ██╗ █████╗ ██████╗ ███████╗███████╗███╗   ██╗]],
-- 			[[╚══██╔══╝██╔══██╗██║  ██║   ██╔════╝██╔════╝██║  ██║██║    ██║██╔══██╗██╔══██╗╚══███╔╝██╔════╝████╗  ██║]],
-- 			[[   ██║   ██║  ██║███████║   ███████╗██║     ███████║██║ █╗ ██║███████║██████╔╝  ███╔╝ █████╗  ██╔██╗ ██║]],
-- 			[[   ██║   ██║  ██║██╔══██║   ╚════██║██║     ██╔══██║██║███╗██║██╔══██║██╔══██╗ ███╔╝  ██╔══╝  ██║╚██╗██║]],
-- 			[[   ██║   ██████╔╝██║  ██║██╗███████║╚██████╗██║  ██║╚███╔███╔╝██║  ██║██║  ██║███████╗███████╗██║ ╚████║]],
-- 			[[   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝]],
-- 			[[                                                                                                        ]],
-- 		},
-- 		shortcut = {
-- 			{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
-- 			{
-- 				icon = " ",
-- 				icon_hl = "@variable",
-- 				desc = "Files",
-- 				group = "Label",
-- 				action = "Telescope find_files",
-- 				key = "f",
-- 			},
-- 			{
-- 				desc = " Apps",
-- 				group = "DiagnosticHint",
-- 				action = "Telescope app",
-- 				key = "a",
-- 			},
-- 			{
-- 				desc = " dotfiles",
-- 				group = "Number",
-- 				action = "Telescope dotfiles",
-- 				key = "d",
-- 			},
-- 		},
-- 	},
-- }
--
-- -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
-- db.setup(opts)
