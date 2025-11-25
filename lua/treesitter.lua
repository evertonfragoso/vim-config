require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "typescript", "ruby", "json", "yaml", "bash", "html", "css", "markdown" },
  highlight = { enable = true },
  indent = { enable = true }
})
