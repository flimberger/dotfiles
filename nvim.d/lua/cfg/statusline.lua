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

local function formatbranch(b)
	s, e = string.find(b, '/', 1, true)
	if s ~= nil then
		b = string.sub(b, e+1)
	end
	if #b > 12 then
		b = string.sub(b, 1, 12)
	end
	return b
end

require('lualine').setup {
	options = {
		theme = 'auto',
		icons_enabled = false,
		-- this seems not be working, use vim.opt.laststatus = 3 after requiring the statusline setup
		-- globalstatus = true,
		component_separators = { left = '', right = '╱' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_b = {
			{ 'branch', fmt = formatbranch },
			'diff',
			make_gap(p.darkblue),
			{ 'diagnostics', source = { 'nvim_lsp' }, sections = { 'error' }, diagnostics_color = { error = { bg = p.red, fg = p.white } }, separator = { right = '' }, },
			make_gap(p.mediumblue),
			{ 'diagnostics', source = { 'nvim_lsp' }, sections = { 'warn' }, diagnostics_color = { warn = { bg = p.orange, fg = p.white } }, separator = { right = '' }, },
		},
		lualine_c = {
			{ 'filename', file_status = false, separator = { right = '' } },
			{ modified, color = { bg = p.orange, fg = p.darkerblue }, separator = { right = '' } },
		},
	},
}
vim.opt.laststatus = 3
