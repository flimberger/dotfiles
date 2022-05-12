-- the statusline uses the lualine package.
-- this configuration based on the slanted gaps example from lualine

local function modified()
	if vim.bo.modified then
		return '+'
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return '-'
	else
		return ''
	end
end

require('lualine').setup {
	options = {
		theme = 'auto',
		icons_enabled = false,
		--global_status = true,
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
