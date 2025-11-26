vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		require("persistence").save()
	end,
})
