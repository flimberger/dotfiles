-- the statusline uses the lualine package.
-- this configuration based on the slanted gaps example from lualine

local p = require('deepsea').palette

local function modified()
	if vim.bo.modified then
		return '+'
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return '-'
	else
		return ''
	end
end

local gap = require('lualine.component'):extend()
function gap:draw(default_highlight)
	self.status = ''
	self.applied_separator = ''
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

local function make_gap(c)
	return { gap, color = { fg = c, bg = c }, separator = { right = '' } }
end

require('lualine').setup {
	options = {
		theme = 'auto',
		icons_enabled = false,
		--global_status = true,
		component_separators = { left = '', right = '╱' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_b = {
			'branch',
			'diff',
			make_gap(p.darkblue),
			{ 'diagnostics', source = { 'nvim' }, sections = { 'error' }, diagnostics_color = { error = { bg = p.red, fg = p.white } }, separator = { right = '' }, },
			make_gap(p.mediumblue),
			{ 'diagnostics', source = { 'nvim' }, sections = { 'warn' }, diagnostics_color = { warn = { bg = p.orange, fg = p.white } }, separator = { right = '' }, },
		},
		lualine_c = {
			{ 'filename', file_status = false, separator = { right = '' } },
			{ modified, color = { bg = p.orange, fg = p.darkerblue }, separator = { right = '' } },
		},
	},
}
