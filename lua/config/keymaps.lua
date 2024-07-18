local Utils = require('config.utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap

vim.g.mapleader = " "

-- Reload window
nnoremap("<leader>l", ":redraw")

-- Go back from file buffer to file explorer
nnoremap("<leader>bp", ":Ex<CR>")

-- Splits buffer
nnoremap("<leader>ws", ":split<CR>")
nnoremap("<leader>vs", ":vsplit<CR>")

-- Find out later how to create vsode commands Shift+Alt+Arrow

-- Select whole line (enter visual/line mode)
nnoremap("<C-l>", "V")
inoremap("<C-l>", "V")

-- Copy to system clippboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- Paste from system clippboard
nnoremap("<leader>P", '"+p')
vnoremap("<leader>P", '"+p')

-- Open git panel (fugitive.nvim)
nnoremap("<leader>gs", ":Git<CR>")

-- Telescope configurations (telescope.nvim)
nnoremap("<leader>ff", "<Cmd>Telescope find_files<CR>")
nnoremap("<leader>gf", "<:Telescope git_files<CR>")
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ")});
end)

-- Undotree
nnoremap("<leader>u", ":UndotreeToggle")

-- Vim-commentary
-- Have to configure this later

