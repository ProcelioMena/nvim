# Neovim Configuration

A modular and efficient Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Features

- **Plugin Management:** Powered by `lazy.nvim`.
- **LSP Support:** Configured for various languages with auto-attach keymaps.
- **AI Integration:** Integrated with [CodeCompanion.nvim](https://github.com/olimorris/codecompanion.nvim) using Gemini.
- **File Navigation:** [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) and [Harpoon](https://github.com/ThePrimeagen/harpoon).
- **Formatting:** [Conform.nvim](https://github.com/stevearc/conform.nvim) for consistent code style.
- **Git Integration:** [Vim-Fugitive](https://github.com/tpope/vim-fugitive).
- **Undo History:** [Undotree](https://github.com/mbbill/undotree).

## Requirements

- Neovim >= 0.9.0
- A Nerd Font (recommended for icons)
- `git`, `make`, `unzip`, `gcc`, `ripgrep` (for various plugins)
- `GEMINI_API_KEY` environment variable (for AI features)

## Installation

### 1. Clone the Repository

Clone this repository into your Neovim configuration directory:

```bash
git clone git@github.com:ProcelioMena/nvim.git ~/.config/nvim
```

### 2. Launch Neovim

Open Neovim:

```bash
nvim
```

`lazy.nvim` will automatically bootstrap itself and begin installing the configured plugins.

### 3. Setup AI Features (Optional)

Ensure you have your Gemini API key set in your environment:

```bash
export GEMINI_API_KEY="your_api_key_here"
```

## Keymaps

The leader key is set to `<Space>`.

### General
| Keymap | Action |
| --- | --- |
| `<leader>pv` | Open Netrw (Project View) |
| `jk` | Exit Insert Mode |
| `<leader>f` | Format buffer |
| `<leader>s` | Search and replace word under cursor |

### Navigation (Telescope & Harpoon)
| Keymap | Action |
| --- | --- |
| `<leader>pf` | Find files |
| `<C-p>` | Git files |
| `<leader>ps` | Grep search |
| `<leader>a` | Harpoon: Add file |
| `<C-e>` | Harpoon: Toggle menu |
| `<C-h/t/n/s>`| Harpoon: Navigate to files 1-4 |

### AI (CodeCompanion)
| Keymap | Action |
| --- | --- |
| `<leader>ai` | AI Actions menu |
| `<leader>c` | Toggle AI Chat |
| `ga` | Add selection to AI Chat |

### Git
| Keymap | Action |
| --- | --- |
| `<leader>gs` | Git Status (Fugitive) |

## Structure

```text
.
├── init.lua            # Entry point
└── lua/
    ├── config/         # General settings and keymaps
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins/        # Plugin-specific configurations
        ├── codecompanion.lua
        ├── lsp.lua
        └── ...
```
