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

-- workaround for xterm, which doesn't handle code points from powerline private
-- use area. U+1FB41 and U+1FB66 from "Symbols for Legacy Computing" would work,
-- too, but are also not available on my current fonts in xterm. The available
-- glyphs U+25E3 ◣ (black lower left triangle) and U+x25E5 ◥ (black upper right
-- triangle) do not fill the cells properly, so they look pretty bad.
local sectionseparators = { left = '', right = '' }
if os.getenv('TERM') ~= 'xterm.*' then
	-- use some other box drawing characters
	-- sectionseparators = { left = '░', right = '▓' }
	sectionseparators = { left = '▙', right = '▟' }
end

require('lualine').setup {
	options = {
		theme = 'auto',
		icons_enabled = false,
		component_separators = { left = '╲', right = '╱' },
		--section_separators = { left = '', right = '' },
		section_separators = sectionseparators
	},
	sections = {
		lualine_c = {
			{ 'filename', file_status = false },
			{ modified, color = { bg = '#ff9900', fg = '#001122' } },
		},
	},
}
