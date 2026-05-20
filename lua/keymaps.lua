local map = vim.keymap.set
local dashboard = require("dashboard")

-- Space as leader
vim.g.mapleader = " "

-- File operations
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
-- map("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
local function close_buffer_or_exit()
	if vim.bo.filetype == "alpha" then
		vim.cmd("qa")
		return
	end

	local buffers = dashboard.listed_file_buffers()
	local current = vim.api.nvim_get_current_buf()
	local current_index

	for index, bufnr in ipairs(buffers) do
		if bufnr == current then
			current_index = index
			break
		end
	end

	pcall(vim.api.nvim_buf_delete, current, {})

	vim.defer_fn(function()
		local remaining = dashboard.listed_file_buffers()

		if #remaining == 0 then
			dashboard.open_dashboard_if_needed()
			return
		end

		local target = remaining[current_index or 1] or remaining[#remaining]

		if target and vim.api.nvim_buf_is_valid(target) then
			pcall(vim.api.nvim_set_current_buf, target)
		end
	end, 20)
end

map("n", "<leader>q", close_buffer_or_exit, { noremap = true, silent = true, desc = "Close buffer or quit" })

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

-- Splitting
vim.keymap.set("n", "<leader>s", ":split<CR>", { desc = "Slit panel horizontally" })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Slit panel vertically" })
vim.keymap.set("n", "<leader>x", ":close<CR>", { desc = "Close current panel" })
-- Splitting movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left panel" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom panel" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up panel" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right panel" })
-- Splitting expanding
vim.keymap.set("n", "mm", "<C-w>|", { desc = "Expand current panel" })
vim.keymap.set("n", "nm", "<C-w>=", { desc = "Divide window equally" })

-- Telescope
vim.keymap.set("n", "<C-O>", ":Telescope find_fiels<CR>", { desc = "Open workspace folder" })
vim.keymap.set("n", "<C-P>", ":Telescope project<CR>", { desc = "Open Project (Telescope)" })

-- Clear search but keep active pattern
map("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Jump to specific buffer
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		local bufs = vim.fn.getbufinfo({ buflisted = 1 })
		local visible = {}

		for _, buf in ipairs(bufs) do
			if vim.bo[buf.bufnr].filetype ~= "alpha" then
				table.insert(visible, buf.bufnr)
			end
		end

		local target = visible[i]

		if target then
			vim.api.nvim_set_current_buf(target)
		end
	end, { desc = "Go to buffer " .. i })
end
