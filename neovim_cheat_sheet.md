# Neovim IDE Cheat Sheet

## Leader Key

`<space>`

## File Management

- `<leader>e` → Toggle file explorer
- `Ctrl + ^` → Toggle between last two files
- `:cd <path>` → Change directory

## Telescope

- `<leader>ff` → Find files
- `<leader>fg` → Live grep
- `<leader>fb` → Buffers
- `<leader>fh` → Help
- [Default Mappings](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings)

## LSP

- `gd` → Go to definition
- `gr` → References
- `K` → Hover docs
- `<leader>rn` → Rename
- `<leader>ca` → Code actions
- `]d / [d` → Next/prev diagnostic

## Git

- `:Neogit` → Git panel
- `:DiffviewOpen` → Git diff
- `]c / [c` → Next/prev hunk

## Editing

- `gcc` → Comment line
- `gc{motion}` → Comment selection
- `cs"'` → Change " to '
- `ds"` → Remove surrounding "

## Debugging (DAP)

- `:lua require("dap").continue()` → Start
- `:lua require("dap").toggle_breakpoint()` → Breakpoint
- `:lua require("dapui").open()` → UI open

## Formatting (conform)

- `:Format` → Format buffer <small>(does not work as of now)</small>

## Linting (nvim-lint)

- `:lua require("lint").try_lint()` → Lint

## Treesitter

- `za` → Toggle fold
- `zR` → Open all folds
- `zM` → Close all folds
