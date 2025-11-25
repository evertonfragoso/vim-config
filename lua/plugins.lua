-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP + tooling
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- File tree with icons
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- Statusline
  "nvim-lualine/lualine.nvim",

  -- Git
  "lewis6991/gitsigns.nvim",
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",

  -- DAP (debugging)
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "nvim-neotest/nvim-nio",

  -- Auto pairs, surround, comments
  "windwp/nvim-autopairs",
  "tpope/vim-surround",
  "numToStr/Comment.nvim",

  -- Formatters
  "stevearc/conform.nvim",

  -- Linters
  "mfussenegger/nvim-lint",

  -- Theme (macOS look)
  "catppuccin/nvim",
})
