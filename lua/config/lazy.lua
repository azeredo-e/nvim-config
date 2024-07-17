local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Theme
    {"folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-moon]])
        end
    },

    -- Fuzzy finder
    {"nvim-telescope/telescope.nvim",
        config = function()
            require('plugins.telescope')
        end
    },

    -- Never quite understood why treesitter exists
    {'nvim-treesitter/nvim-treesitter',
        lazy = false,
        config = function()
            require('plugins.treesitter')
        end,
        build = ':TSUpdate'
    },

    -- Highlight selected word
    {"RRethy/vim-illuminate",
        config = function()
            require("plugins.iluminate")
        end
    },

    {"theprimeagen/harpoon",
        config = function()
            require("plugins.harpoon")
        end
    },

    -- Maybe change for https://github.com/jiaoshijie/undotree
    {"mbbill/undotree"},

    -- Git integration
    {"tpope/vim-fugitive"},

    -- (Un)Comment lines
    {"tpope/vim-commentary"},

    -- Terminal
    {'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require('plugins.toggleterm')
        end
    },

    -- LSP stuff
    {"williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {"williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    {"neovim/nvim-lspconfig",
        config = function()
            require('plugins.lsp')
        end
    },

    -- Signature help
    {"ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup()
        end
    },

    -- Gitsigns
    {'lewis6991/gitsigns.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            require('plugins.gitsigns')
        end
    },

    -- Info bar
    {'freddiehaddad/feline.nvim',
        opts = {},
        config = function()
            require("plugins.feline").setup()
        end
    },
    {"nvim-tree/nvim-web-devicons"}
}

require('lazy').setup(plugins)
