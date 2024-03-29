-- always available mappings
local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', options)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
map('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', options)

-- mappings available with lsp client attached
local function on_attach(client, bufn)
	-- omnifunc completions (<c-x><c-o>)
	vim.api.nvim_buf_set_option(bufn, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- mappings
	local map = vim.api.nvim_buf_set_keymap
	map(bufn, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
	map(bufn, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
	map(bufn, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
	map(bufn, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
	map(bufn, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
	map(bufn, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
	map(bufn, 'n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
	map(bufn, 'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
	map(bufn, 'n', '<Leader>ch', '<cmd>lua vim.lsp.buf.clear_references()<CR>', options)
	map(bufn, 'n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', options)
	map(bufn, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
	map(bufn, 'n', '<Leader>w', '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, })<CR>', options)
	map(bufn, 'n', '<Leader>W', '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN, })<CR>', options)
	map(bufn, 'n', '<Leader>e', '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, })<CR>', options)
	map(bufn, 'n', '<Leader>E', '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, })<CR>', options)
	map(bufn, 'n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', options)
end

local lsp = require('lspconfig')
for _, s in ipairs({ 'clangd', 'erlangls', 'gopls', 'rust_analyzer' }) do
	lsp[s].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end

-- this is provided built-in by lspconfig when clangd is active
map('n', '<F10>', '<cmd>ClangdSwitchSourceHeader<cr>', options)
