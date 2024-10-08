# My Neovim Configuration

This repository contains my personal Neovim configuration, designed to enhance productivity and provide a comfortable editing experience.

## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- Custom key mappings for improved navigation and workflow
- Syntax highlighting and language support with Treesitter
- LSP integration for code intelligence
- Fuzzy finding with Telescope
- File explorer with oil.nvim
- Customizable start screen with alpha-nvim
- Toggleable whitespace display
- And more!

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

## Key Features and Mappings

- Leader key is set to space
- `<leader>tw`: Toggle whitespace display
- `<leader>ff`: Find files with Telescope
- `<leader>fw`: Live grep with Telescope
- `j`, `k`, `l`, `;`: Remapped for more ergonomic navigation
- And many more! Check `lua/config/mappings.lua` for a full list

## Customization

Feel free to modify any of the configuration files to suit your needs. The main configuration is split into several files under the `lua/` directory for better organization.

## Contributing

If you have any suggestions or improvements, feel free to open an issue or submit a pull request!

## License

This project is open source and available under the [MIT License](LICENSE).
