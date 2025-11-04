# Neovim Configuration (LazyVim)

## Project Overview

This directory contains a personalized Neovim configuration built upon [LazyVim](https://lazyvim.org/). It leverages `lazy.nvim` for plugin management and provides a highly customized and optimized development environment. The configuration includes a variety of extra plugins for language support, formatting, linting, and UI enhancements, as specified in `lazyvim.json`.

## Key Configuration Files

*   **`init.lua`**: The entry point for the Neovim configuration, responsible for bootstrapping `lazy.nvim` and loading the main configuration.
*   **`lazyvim.json`**: Defines additional LazyVim "extras" that extend the core LazyVim functionality with support for various languages (e.g., TypeScript, Go, Docker), formatting (Prettier), linting (ESLint), and other utilities.
*   **`lua/config/lazy.lua`**: Configures the `lazy.nvim` plugin manager, specifying which plugins to load, including LazyVim's core plugins and custom plugins located in the `lua/plugins` directory. It also enables automatic plugin updates.
*   **`lua/config/keymaps.lua`**: Contains custom keybindings to enhance navigation and workflow within Neovim.
*   **`lua/config/options.lua`**: Sets various Neovim options to tailor the editor's behavior and appearance.
*   **`lua/plugins/`**: This directory contains custom Neovim plugins or overrides for existing plugins.

## Building and Running

This is a Neovim configuration, not a traditional software project that requires building or running in the conventional sense. To "run" this configuration, you need to have Neovim installed.

1.  **Install Neovim:** Follow the instructions on the [Neovim website](https://neovim.io/doc/user/install.html).
2.  **Clone this repository:** Place this entire directory in `~/.config/nvim` (or `~/.config/nvim-lazy` if you want to keep it separate and link it).
3.  **Launch Neovim:** Open your terminal and type `nvim`. LazyVim will automatically install the necessary plugins on first launch.

## Development Conventions

*   **Plugin Management:** Plugins are managed using `lazy.nvim`. New plugins or overrides should be placed in the `lua/plugins` directory.
*   **Configuration:** Core Neovim options and keymaps are defined in `lua/config/options.lua` and `lua/config/keymaps.lua` respectively.
*   **LazyVim Extras:** Additional features and language support are enabled via `lazyvim.json` by specifying LazyVim "extras."
*   **Styling:** `stylua.toml` indicates that `stylua` is used for Lua code formatting.
