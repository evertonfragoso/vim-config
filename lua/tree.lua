require("nvim-tree").setup({
  view = {
    width = 32,
    side = "left",
  },
  renderer = {
    icons = {
      show = { git = true, folder = true, file = true, folder_arrow = true }
    }
  }
})
