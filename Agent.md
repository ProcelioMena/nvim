# Agent Instructions

This document provides context and guidelines for AI agents working on this Neovim configuration.

## Architectural Overview

- **Bootstrap:** `init.lua` sets the leader key and bootstraps `lazy.nvim`.
- **Configuration:** Core settings are split into `lua/config/options.lua` and `lua/config/keymaps.lua`.
- **Plugins:** Each plugin or group of related plugins should have its own file in `lua/plugins/`. `lazy.nvim` is configured to automatically load all files in this directory.

## Engineering Standards

- **Language:** Use Lua for all configuration.
- **Keybindings:** Use `vim.keymap.set` for defining keymaps. Prefer descriptive comments and unique `desc` fields for better discoverability.
- **Modularity:** Avoid bloating `init.lua`. Keep plugin-specific logic within its respective file in `lua/plugins/`.
- **Formatting:** Adhere to the formatting rules defined in `lua/plugins/conform.lua`.
- **LSP:** Add new language servers to `lua/plugins/lsp.lua` using `mason-lspconfig` or direct `lspconfig` setup.

## AI & Tooling

- This configuration includes **CodeCompanion.nvim** with Gemini integration.
- When suggesting changes that involve new plugins, ensure they are compatible with the existing `lazy.nvim` structure.
- Always check `lua/config/keymaps.lua` before adding new keybindings to avoid conflicts.

## Project Vision

Maintain a lightweight, fast, and keyboard-centric development environment that leverages modern Neovim features (LSP, Treesitter) and AI assistance where appropriate.
