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

    -- Autocomplete
    {"hrsh7th/nvim-cmp", -- This one manages all cmp plugins, check the github for configurations
        event = "InsertEnter",
        -- Sources for nvim-cmp
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- This one makes the lsp work
            -- "hrsh7th/cmp-nvim-lsp-signature-help", -- This one is for signatures, later i check if this one is better than the one by ray-x
            "hrsh7th/cmp-buffer", -- Don't get it, but will leave it
            "hrsh7th/cmp-path", -- This one is for paths
            "hrsh7th/cmp-nvim-lua", -- apparently this one is specific for nvim lua
            "hrsh7th/cmp-cmdline", -- for the shell
            "saadparwaiz1/cmp_luasnip", -- No idea but will leave it as is
        },
        config = function()
            require('plugins.cmp')
        end,
    },

    -- Signature help
    {"ray-x/lsp_signature.nvim",
        config = function()
            local cfg = {
                toggle_key = "<leader>S" 
            }
            require("lsp_signature").setup(cfg)
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
