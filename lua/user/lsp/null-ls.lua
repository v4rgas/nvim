local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		-- css
		formatting.prettier.with({
			extra_filetypes = { "css" },
		}),

		-- markdown
		-- diagnostics.markdownlint,
		-- lua
		formatting.stylua,

		-- js
		formatting.eslint_d,
		diagnostics.eslint,

		-- python
		formatting.autopep8,
		diagnostics.flake8,
	},
})
