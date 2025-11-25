local lint = require("lint")

lint.linters_by_ft = {
	python = { "flake8" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	ruby = { "rubocop" },
	sh = { "shellcheck" },
}

-- Trigger linting on save & when leaving insert mode
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
