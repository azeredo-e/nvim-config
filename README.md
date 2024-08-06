# My NVim Config (still figuring out)

A Neovim configuration using Lua.

I've written thie README as a way to keep track of everything that comes in making this config work as I want it to.

This config was heavily inspired by [miltonllera/nvim-config](https://github.com/miltonllera/neovim-config/tree/master).

## Requirements

### Compilers and interpreters

Treesitter and some other plugins don't work whithout a C compiler. Use gcc with MinGW. Download is avaliable [here](https://sourceforge.net/projects/mingw/)

---

Node is also needed. You can use:

```poweshell
# installs fnm (Fast Node Manager)
winget install Schniz.fnm

```

If it errors, just run the command that errored again, maybe PS haven't updated the registry yet and hadn't found the command.

After that include this lines at the end of the profile.ps1 file.

```powershell
# configure fnm environment
fnm env --use-on-cd | Out-String | Invoke-Expression

# download and install Node.js
fnm use --install-if-missing 22
```

### Fonts

Before using this thing you need to make sure that the installed font on the terminal is a compatible nerd font.

I'm using [this one](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNLNerdFontMono-Regular.ttf) JetBrains Mono


## Installed plugins

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- folke/tokyonight.nvim
- nvim-telescope/telescope.nvim
- nvim-treesitter/nvim-treesitter
- RRethy/vim-illuminate
- theprimeagen/harpoon
- mbbill/undotree
- tpope/vim-fugitive (Git integration)
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary) (Shortcut to comment and uncomment lines)
- akinsho/toggleterm.nvim
- williamboman/mason.nvim
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- neovim/nvim-lspconfig
- ray-x/lsp_signature.nvim (Brings up the docstring for function, not sure about this one yet)
- freddiehaddad/feline.nvim
- lewis6991/gitsigns.nvim
  - nvim-lua/plenary.nvim
- nvim-tree/nvim-web-devicons
