local present, _ = pcall(require, "plugins.packerInit")
local packer

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])


if present then
    packer = require "packer"
else
    return false
end


local use = packer.use

return packer.startup(
    function()

        use "wbthomason/packer.nvim"

        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("plugins.configs.colorizer")
            end
        }

        use {
            "akinsho/nvim-bufferline.lua",
            config = function()
                require "plugins.configs.bufferline"
            end
        }

        use {
            "kyazdani42/nvim-web-devicons",
            config = function()
            require "plugins.configs.icons"
            end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
                require "plugins.configs.nvimtree"
            end
        }

        use "francoiscabrol/ranger.vim"
        use "rbgrouleff/bclose.vim"

        use {
            "glepnir/galaxyline.nvim",
            config = function()
                require "plugins.configs.statusline"
            end
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require "plugins.configs.treesitter"
            end
        }

        use {
            "kabouzeid/nvim-lspinstall",
            event = "BufRead",
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function()
                require "plugins.configs.lspconfig"
            end,
        }

        use {
            "onsails/lspkind-nvim",
            config = function()
                require("plugins.configs.lspkind")
            end
        }

        use {
            "hrsh7th/nvim-compe",
            config = function()
                require "plugins.configs.compe"
            end
        }

        use {
            'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
        }

        use {
            "windwp/nvim-autopairs",
            config = function()
                require "plugins.configs.autopairs"
            end,
        }

        use {
            "andymass/vim-matchup",
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
        }

        use {
            'lewis6991/gitsigns.nvim',
            requires = {
            'nvim-lua/plenary.nvim'
            },
            config = function()
                require('gitsigns').setup()
            end,
        }

        use {
            "glepnir/dashboard-nvim",
            cmd = {
                "Dashboard",
                "DashboardNewFile",
                "DashboardJumpMarks",
                "SessionLoad",
                "SessionSave",
            },
            config = function()
                require "plugins.configs.dashboard"
            end,
        }

        use {
            "lervag/vimtex",
            ft = {"tex"}
        }

        use {
            "xuhdev/vim-latex-live-preview",
            ft = {"tex"}
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {'nvim-lua/plenary.nvim'},
                {"nvim-telescope/telescope-fzy-native.nvim"}
            },
            config = function()
                require "plugins.configs.telescope"
            end,
        }
    end
)
