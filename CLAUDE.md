# NeoVim Configuration Notes

This file contains useful information about your NeoVim configuration to help Claude assist you better.

## Commands

### Style and Linting
- Style checking: `stylua --check .`
- Style fixing: `stylua .`

## Configuration Structure
- `init.lua`: Bootstrap file that loads the main configuration
- `lua/config/`: Core configuration files
  - `lazy.lua`: Plugin manager setup
  - `options.lua`: NeoVim options
  - `keymaps.lua`: Key mappings
  - `autocmds.lua`: Autocommands
- `lua/plugins/`: Plugin-specific configurations

## Preferences
- Style: Uses stylua for Lua formatting
- Plugin manager: lazy.nvim