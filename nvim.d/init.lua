vim.opt.fileencoding = 'utf-8'

vim.opt.cursorline = true
vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- color scheme
vim.opt.termguicolors = true -- enable true color support
vim.api.nvim_command "colorscheme deepsea"

-- fzf
vim.env.FZF_DEFAULT_OPTS = "--layout=reverse"
vim.g.fzf_layout = { window = { width = 0.9, height = 0.85, relative = true, yoffset = 0.25 } }

-- keybindings
vim.g.mapleader = " "
defmapopts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-P>", "<cmd>GFiles<CR>", defmapopts)

-- more complex configuration is separated out into separate files
require('cfg/lsp')
require('cfg/statusline')
