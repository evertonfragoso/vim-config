local map = vim.keymap.set

-- Space as leader
vim.g.mapleader = " "

-- File operations
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
map("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

-- File tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

-- Toggle between buffers
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Switch to last buffer" })

-- Jump to specific buffer
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		vim.cmd("buffer " .. i)
	end, { desc = "Go to buffer " .. i })
end
