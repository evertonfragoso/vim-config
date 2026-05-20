local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local M = {}

-- ====================================================================
-- HEADER (EVERTRON)
-- ====================================================================

dashboard.section.header.val = {
  "▓█████ ██▒   █▓▓█████ ██▀███  ▄▄▄█████▓ ██▀███   ▒█████   ███▄    █ ",
  "▓█   ▀▓██░   █▒▓█   ▀▓██ ▒ ██▒▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒ ██ ▀█   █ ",
  "▒███   ▓██  █▒░▒███  ▓██ ░▄█ ▒▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██  ▀█ ██▒",
  "▒▓█  ▄  ▒██ █░░▒▓█  ▄▒██▀▀█▄  ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▓██▒  ▐▌██▒",
  "░▒████   ▒▀█░  ░▒████░██▓ ▒██▒  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██░   ▓██░",
  "░░ ▒░    ░ ▐░  ░░ ▒░ ░ ▒▓ ░▒▓░  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ▒░   ▒ ▒ ",
  " ░ ░     ░ ░░   ░ ░    ░▒ ░ ▒░    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░ ░░   ░ ▒░",
  "   ░       ░░     ░     ░   ░   ░ ░       ░   ░ ░ ░ ░ ▒     ░   ░ ░ ",
  "   ░        ░     ░     ░                 ░         ░ ░           ░ ",

  -- "███████╗██╗   ██╗███████╗██████╗ ████████╗██████╗  ██████╗ ███╗   ██╗",
  -- "██╔════╝██║   ██║██╔════╝██╔══██╗╚══██╔══╝██╔══██╗██╔═══██╗████╗  ██║",
  -- "█████╗  ██║   ██║█████╗  ██████╔╝   ██║   ██████╔╝██║   ██║██╔██╗ ██║",
  -- "██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔══██╗   ██║   ██╔══██╗██║   ██║██║╚██╗██║",
  -- "███████╗ ╚████╔╝ ███████╗██║  ██║   ██║   ██║  ██║╚██████╔╝██║ ╚████║",
  -- "╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝",

  -- "░░░░░░░ ░░    ░░ ░░░░░░░ ░░░░░░  ░░░░░░░░ ░░░░░░   ░░░░░░  ░░░    ░░",
  -- "▒▒      ▒▒    ▒▒ ▒▒      ▒▒   ▒▒    ▒▒    ▒▒   ▒▒ ▒▒    ▒▒ ▒▒▒▒   ▒▒",
  -- "▒▒▒▒▒   ▒▒    ▒▒ ▒▒▒▒▒   ▒▒▒▒▒▒     ▒▒    ▒▒▒▒▒▒  ▒▒    ▒▒ ▒▒ ▒▒  ▒▒",
  -- "▓▓       ▓▓  ▓▓  ▓▓      ▓▓   ▓▓    ▓▓    ▓▓   ▓▓ ▓▓    ▓▓ ▓▓  ▓▓ ▓▓",
  -- "███████   ████   ███████ ██   ██    ██    ██   ██  ██████  ██   ████",
}

dashboard.section.header.opts = {
  position = "center",
}

-- Helper to build a category header line
local function category(title)
  return {
    type = "text",
    val = "  " .. title,
    opts = {
      position = "center",
      hl = "Keyword",
    },
  }
end

-- Helper to build a group of buttons
local function buttons(entries)
  return {
    type = "group",
    val = entries,
    opts = {
      spacing = 0,
    },
  }
end

-- Shorthand for buttons
local button = function(shortcut, text, cmd)
  return dashboard.button(shortcut, text, cmd)
end

-- ====================================================================
-- SECTIONS
-- ====================================================================

-- Files section
local files_section = {
  category("Files"),
  buttons({
    button("n", "  New file", ":ene <BAR> startinsert<CR>"),
    button("f", "󰈞  Find file (Telescope)", ":Telescope find_files<CR>"),
    button("r", "󰋚  Recent files (MRU)", ":Telescope oldfiles<CR>"),
    button("e", "󰙅  File explorer (nvim-tree)", ":NvimTreeToggle<CR>"),
  }),
}

-- Search section
local search_section = {
  category("Search"),
  buttons({
    button("F", "󰈭  Live grep in project", ":Telescope live_grep<CR>"),
    button("B", "󰂺  Search open buffers", ":Telescope buffers<CR>"),
    button("H", "󰋖  Search help tags", ":Telescope help_tags<CR>"),
  }),
}

-- Projects / Sessions section
-- Note: `:Telescope projects` assumes you install telescope-project or similar.
local project_section = {
  category("Projects / Sessions"),
  buttons({
    button("O", "  Open workspace folder", ":Telescope find_files<CR>"),
    button("P", "  Open project (Telescope)", ":Telescope project<CR>"),
    button("S", "󰦕  Restore last session", ":lua require('persistence').load({ last = true })<CR>"),
  }),
}

-- Git section
local git_section = {
  category("Git"),
  buttons({
    button("G", "󰊢  Open Neogit", ":Neogit<CR>"),
    button("D", "  Diffview (current branch)", ":DiffviewOpen<CR>"),
  }),
}

-- Config / Tools section
local config_section = {
  category("Config / Tools"),
  buttons({
    button("C", "  Edit Neovim config", ":e ~/.config/nvim/init.lua<CR>"),
    button("K", "󰌌  Edit keymaps", ":e ~/.config/nvim/lua/keymaps.lua<CR>"),
    button("L", "󰒲  Plugin manager (Lazy)", ":Lazy<CR>"),
    button("M", "  Package manager (Mason)", ":Mason<CR>"),
    button("q", "󰗼  Quit Neovim", ":qa<CR>"),
  }),
}
-- 
-- ====================================================================
-- LAYOUT
-- ====================================================================

dashboard.section.buttons.val = {
  files_section[1],
  files_section[2],

  search_section[1],
  search_section[2],

  project_section[1],
  project_section[2],

  git_section[1],
  git_section[2],

  config_section[1],
  config_section[2],
}

-- Footer
dashboard.section.footer.val = "Evertron · Neovim IDE · Build something good today."
dashboard.section.footer.opts = {
  position = "center",
  hl = "Comment",
}

-- Final setup
alpha.setup(dashboard.opts)

local function listed_file_buffers()
  local listed = vim.fn.getbufinfo({ buflisted = 1 })
  local clean = {}

  for _, buf in ipairs(listed) do
    local is_alpha = vim.bo[buf.bufnr].filetype == "alpha"
    local has_name = buf.name ~= ""
    local is_normal = vim.bo[buf.bufnr].buftype == ""

    if not is_alpha and has_name and is_normal then
      table.insert(clean, buf.bufnr)
    end
  end

  return clean
end

local function open_dashboard_if_needed()
  local file_buffers = listed_file_buffers()

  if #file_buffers == 0 then
    -- Clean up stray unnamed buffers so Alpha is the only focus
    for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
      local is_alpha = vim.bo[buf.bufnr].filetype == "alpha"
      if not is_alpha and buf.name == "" then
        pcall(vim.api.nvim_buf_delete, buf.bufnr, { force = true })
      end
    end

    if vim.bo.filetype ~= "alpha" then
      vim.cmd("Alpha")
    end

    return true
  end

  return false
end

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "alpha" then
      return
    end

    vim.defer_fn(function()
      open_dashboard_if_needed()
    end, 20)
  end,
})

M.listed_file_buffers = listed_file_buffers
M.open_dashboard_if_needed = open_dashboard_if_needed

return M
