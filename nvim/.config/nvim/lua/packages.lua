local packages = {
    { "wbthomason/packer.nvim", opt = true },
    { "Akin909/nvim-bufferline.lua", config = "require [[bufferline]].setup()" },
    "dense-analysis/ale",
    "editorconfig/editorconfig-vim",
    "hardcoreplayers/dashboard-nvim",
    "jeffkreeftmeijer/vim-numbertoggle",
    "jiangmiao/auto-pairs",
    "justinmk/vim-gtfo", -- <--
    { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" },
    "liuchengxu/vista.vim",
    { "mattn/vim-sonictemplate", cmd = "Template" },
    {
        "hrsh7th/nvim-compe",
        requires = {
            "norcalli/snippets.nvim",
            { "tami5/compe-conjure", after = "conjure" },
            "tamago324/compe-zsh",
            { "tzachar/compe-tabnine", run = "./install.sh" },
        },
        config = {
            [[
            require'snippets'.use_suggested_mappings()
            require 'my_snippets'
        ]],
        },
    },
    { -- LSP
        "neovim/nvim-lspconfig",
        requires = {
            "nvim-lua/lsp_extensions.nvim",
            "nvim-lua/lsp-status.nvim",
            -- "mfussenegger/nvim-dap",
            -- "theHamsta/nvim-dap-virtual-text",
            { "sakhnik/nvim-gdb", run = "./install.sh", ft = "cpp" },
            {
                "onsails/lspkind-nvim",
                cond = function()
                    return vim.g.uivonim ~= 1
                end,
                config = [[require('lspkind').init()]],
            },
            {
                "glepnir/lspsaga.nvim",
                cond = function()
                    return vim.g.uivonim ~= 1
                end,
                config = [[require 'lspsaga'.init_lsp_saga{
                               use_saga_diagnostic_sign = true,
                               code_action_icon = "✨",
                           }]],
            },
        },
        config = [[
            require 'ls_setup'
            require'lsp_extensions'.inlay_hints {
                highlight = "NonText",
                prefix = " » ",
                aligned = true,
                only_current_line = false,
                enabled = { "ChainingHint" }
            }
        ]],
    },
    { "norcalli/nvim-colorizer.lua", config = { "require [[colorizer]].setup()" } },
    { -- Treesitter
        "nvim-treesitter/nvim-treesitter",
        "~/stuff/projects/nvim-ts-rainbow",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects", -- <--
        "nvim-treesitter/playground",
        "ElPiloto/sidekick.nvim",
        "vigoux/architext.nvim", -- <--
    -- "romgrk/nvim-treesitter-context",
    },
    {
        "Olical/aniseed",
        config = [[require('aniseed.env').init({ module = 'dotfiles.init' })]],
    },
    { -- Lisp
        { "Olical/conjure", ft = { "fennel", "clojure" } },
        { "clojure-vim/vim-jack-in", ft = "clojure" },
        {
            "eraserhd/parinfer-rust",
            run = "cargo build --release",
            ft = { "clojure", "fennel", "lisp", "scheme" },
        },
    },
    "pbrisbin/vim-mkdir",
    {
        "yuttie/comfortable-motion.vim",
        cond = function()
            return (vim.g.neovide ~= true and vim.g.gonvim_running ~= 1)
        end,
    },
    "tpope/vim-surround",
    "tpope/vim-repeat", -- <--
    "tyru/caw.vim",
    { "reedes/vim-pencil", ft = { "txt", "markdown", "rst" } },
    "rhysd/git-messenger.vim",
    {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        cond = function()
            return (vim.g.uivonim ~= 1 and vim.g.gonvim_running ~= 1)
        end,
    },
    "takac/vim-hardtime",
    { "tjdevries/express_line.nvim", config = "require [[expressline_setup]]" },
    "antoinemadec/FixCursorHold.nvim",
    "numtostr/FTerm.nvim",
    {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "nvim-telescope/telescope-packer.nvim",
            "nvim-telescope/telescope-github.nvim",
            "nvim-telescope/telescope-z.nvim",
            "nvim-telescope/telescope-frecency.nvim",
            "tami5/sql.nvim",
            "nvim-telescope/telescope-cheat.nvim",
            "nvim-telescope/telescope-project.nvim"
        --  "nvim-telescope/telescope-dap.nvim",
        },
        config = [[
            require('telescope').setup {
                defaults = {
                    file_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                    prompt_prefix =  "🔭 "
                }
            }
            require('telescope').load_extension('fzy_native')
            require('telescope').load_extension('gh')
            require'telescope'.load_extension('z')
            require'telescope'.load_extension("cheat")
            require'telescope'.load_extension('frecency')
            require'telescope'.load_extension('project')
          --  require('telescope').load_extension('dap')
        ]],
    },
    "mhartington/formatter.nvim",
    { "oknozor/illumination", run = ".install.sh", ft = "markdown" },
    "wfxr/minimap.vim",
    "kdheepak/lazygit.nvim",
    "andymass/vim-matchup",
    "KabbAmine/vCoolor.vim",
    { "lewis6991/gitsigns.nvim", config = [[require('gitsigns').setup{keymaps={}}]] },
    "mtdl9/vim-log-highlighting",
    { "glacambre/firenvim", run = ":call firenvim#install(0)" },
    "luochen1990/rainbow",
    "notomo/helpeek.vim",
    "tjdevries/train.nvim",
    "junegunn/limelight.vim",
    "brooth/far.vim", -- <--
    "tkmpypy/chowcho.nvim",
    "phaazon/hop.nvim",
    { "alx741/neoman.vim", cmd = "Neoman" },
    {
        "~/stuff/projects/cphelper/cphelper.nvim",
        rocks = "http",
        requires = "nvim-lua/plenary.nvim",
    },
    "mhinz/vim-sayonara",
    "delphinus/vim-auto-cursorline",
    "omrisarig13/vim-auto-abbrev",
    "axelf4/vim-strip-trailing-whitespace",
    { -- Lua
        { "rafcamlet/nvim-luapad", ft = "lua" },
        { "tjdevries/manillua.nvim", ft = "lua" },
        { "tjdevries/nlua.nvim", ft = "lua" },
    },
    "tridactyl/vim-tridactyl",
    "yonlu/omni.vim",
}

return packages
