vim.opt.fileencoding = 'utf-8'

vim.opt.cursorline = true
vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- color scheme
vim.opt.termguicolors = true -- enable true color support
vim.api.nvim_command "colorscheme deepsea"

-- more complex configuration is separated out into separate files
require('cfg/lsp')
require('cfg/statusline')
