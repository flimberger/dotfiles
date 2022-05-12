-- mappings
local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', options)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', options)

local function on_attach(client, bufn)
	-- completions with <c-x><c-o>
	vim.api.nvim_buf_set_option(bufn, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- mappings
	local map = vim.api.nvim_buf_set_keymap
	map(bufn, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
	map(bufn, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
	map(bufn, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
end

local lsp = require('lspconfig')
for _, s in ipairs({ 'clangd', 'erlangls', 'gopls', 'rust_analyzer' }) do
	lsp[s].setup {
		on_attach = on_attach,
	}
end
