# My Neovim Configuration

This repository contains my personal Neovim configuration, optimized for modern development workflows with strong support for PHP/Laravel, TypeScript, and Lua development.

## Features

### Core Functionality
- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP integration with automatic server management via Mason
- Intelligent autocompletion with nvim-cmp and LuaSnip
- Fuzzy finding and live grep with Telescope (vertical layout)
- Syntax highlighting and code parsing with Treesitter
- File explorer with nvim-tree
- Custom startup dashboard with project shortcuts

### Language Support
- **PHP**: Intelephense LSP with comprehensive stubs
- **TypeScript/JavaScript**: ts_ls language server
- **Lua**: lua_ls with Neovim runtime integration

### UI and Visual Enhancements
- Gruvbox colorscheme with hard contrast
- Modern status line with lualine
- Tab-like buffer management with bufferline
- Word highlighting under cursor with illuminate
- Custom key mappings for ergonomic navigation

### Development Tools
- Git integration with LazyGit
- AI-powered code completion with Supermaven
- Fast cursor movement with Leap
- Interactive keybinding help with which-key
- Better buffer deletion without breaking layout

## Installation

1. Backup your existing Neovim configuration if you have one:
   ```
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```

3. Start Neovim:
   ```
   nvim
   ```

   Lazy.nvim will automatically install all the plugins on the first run.

## Key Mappings

### Navigation (Ergonomic Layout)
- `j/k/l/;`: Remapped to `h/j/k/l` for better ergonomics
- `J/:`: Buffer navigation (previous/next)
- `<C-j/k/l/;>`: Window navigation
- `h/H/<C-h>`: Leap forward/backward/from window

### File Operations
- `<leader>ff`: Find files (project only)
- `<leader>fF`: Find all files (including hidden)
- `<leader>fw`: Live grep (project only)
- `<leader>fW`: Live grep (including hidden)
- `<leader>fb`: Buffer list
- `<leader>e`: Toggle nvim-tree
- `<leader>tf`: Find current file in nvim-tree

### LSP and Code
- `gd`: Go to definition
- `gr`: Show references
- `gi`: Show implementations
- `gs`: Document symbols
- `<leader>ca`: Code actions
- `<leader>lr`: Rename symbol
- `<leader>d`: Show line diagnostics

### Project Shortcuts
- `pla`: Switch to Librabooks Admin project
- `plu`: Switch to Librabooks UI project
- `pua/puw/pus`: Switch to UNMXR projects

### Other
- `<leader>tw`: Toggle whitespace display
- `<leader>lg`: Open LazyGit
- `Z`: Delete current buffer
- `q`: Close split or quit
- `./:`: Swap command and repeat modes

## Configuration Structure

```
lua/
├── config/
│   ├── lazy.lua          # Plugin manager configuration
│   └── mappings.lua      # All key mappings
├── plugins/
│   ├── alpha.lua         # Startup dashboard
│   ├── avante.lua        # AI assistant (disabled)
│   ├── bufdelete.lua     # Better buffer deletion
│   ├── bufferline.lua    # Buffer tabs
│   ├── colorscheme.lua   # Gruvbox theme
│   ├── completion.lua    # nvim-cmp autocompletion
│   ├── illuminate.lua    # Word highlighting
│   ├── lazygit.lua       # Git integration
│   ├── leap.lua          # Fast navigation
│   ├── lualine.lua       # Status line
│   ├── mason.lua         # LSP server management
│   ├── nvim-tree.lua     # File explorer
│   ├── supermaven.lua    # AI completion
│   ├── telescope.lua     # Fuzzy finder
│   ├── treesitter.lua    # Syntax highlighting
│   └── which-key.lua     # Key binding help
```

## Plugin Details

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| **Mason + LSP** | Language servers | Auto-install PHP, TypeScript, Lua servers |
| **Telescope** | Fuzzy finder | Vertical layout, ripgrep integration |
| **nvim-cmp** | Autocompletion | LSP, snippet, buffer completion |
| **Supermaven** | AI completion | Custom keybinds, lime green highlights |
| **Gruvbox** | Colorscheme | Hard contrast, extensive italic support |
| **Alpha** | Start screen | Custom project shortcuts |
| **Leap** | Navigation | Two-character cursor movement |
| **LazyGit** | Git interface | Floating window integration |

## Customization

The configuration is modular and easily customizable. Key areas:

- **Keymaps**: Modify `lua/config/mappings.lua` for custom bindings
- **LSP**: Adjust language servers in `lua/plugins/mason.lua`
- **Theme**: Change colors in `lua/plugins/colorscheme.lua`
- **Projects**: Update project paths in the Alpha dashboard and mappings

## Contributing

If you have any suggestions or improvements, feel free to open an issue or submit a pull request!

## License

This project is open source and available under the [MIT License](LICENSE).
