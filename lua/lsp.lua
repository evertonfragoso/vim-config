-- Mason manages installations
require("mason").setup()

-- autocompletion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup function for keymaps
local on_attach = function(_, bufnr)
	local map = vim.keymap.set
	local opts = { buffer = bufnr, silent = true }
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Use 'mason-lspconfig' to automatically configure servers
require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"ts_ls",
		"lua_ls",
		"html",
		"cssls",
		"jsonls",
		"bashls",
		"omnisharp",
		"solargraph",
	},
	-- Use the handler to apply the setup to all installed LSPs
	handlers = {
		-- This handler applies the default settings to most LSPs
		function(server_name)
			require("lspconfig")[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,

		-- Special case handler for lua_ls
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
		end,
	},
})
