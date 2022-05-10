vim.opt.bg = 'light'
vim.opt.fileencoding = 'utf-8'

vim.opt.cursorline = true
vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- color scheme
vim.opt.termguicolors = true -- enable true color support
vim.api.nvim_command "colorscheme deepsea"

-- lualine
-- this is not properly incorporated into my general setup
local function modified()
	if vim.bo.modified then
		return '+'
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return '-'
	else
		return ''
	end
end

end

require('lualine').setup {
	options = {
		theme = 'auto',
		icons_enabled = false,
		global_status = true,
		component_separators = { left = '╲', right = '╱' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_c = {
			{ 'filename', file_status = false, separator = { right = '' } },
			{ modified, color = { bg = '#ff9900', fg = '#001122' }, separator = { right = '' } },
		},
	},
}
