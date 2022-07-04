local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		-- general spell
		-- completion.codespell,

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
