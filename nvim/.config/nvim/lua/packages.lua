local packages = {
    { "wbthomason/packer.nvim" },
    {
        "Akin909/nvim-bufferline.lua",
        config = "require [[bufferline]].setup({options={separator_style='slant'}})",
    },
    { "dense-analysis/ale", config = [[require "dotfiles.plugins.ale"]] },
    "editorconfig/editorconfig-vim",
    { "hardcoreplayers/dashboard-nvim", config = [[require "dotfiles.plugins.dashboard"]] },
    "jeffkreeftmeijer/vim-numbertoggle",
    "jiangmiao/auto-pairs",
    "justinmk/vim-gtfo",
    "kyazdani42/nvim-tree.lua",
    {
        "yamatsum/nvim-nonicons",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require'nvim-nonicons']],
    },
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
            require 'dotfiles.plugins.compe'
            require'snippets'.use_suggested_mappings()
            require 'dotfiles.snippets'
            ]],
        },
    },
    { -- LSP
        "neovim/nvim-lspconfig",
        requires = {
            "nvim-lua/lsp_extensions.nvim",
            "nvim-lua/lsp-status.nvim",

            { "folke/lsp-trouble.nvim", config = [[require("trouble").setup()]] },
            {
                "mfussenegger/nvim-dap",
                config = "require('dotfiles.plugins.dap.setup')",
                { "rcarriga/nvim-dap-ui", config = 'require("dapui").setup()' },
            },
            -- "theHamsta/nvim-dap-virtual-text",
            {
                "onsails/lspkind-nvim",
                cond = function()
                    return vim.g.uivonim ~= 1
                end,
                config = "require 'dotfiles.plugins.lspkind'",
            },
            {
                "glepnir/lspsaga.nvim",
                cond = function()
                    return vim.g.uivonim ~= 1
                end,
                config = [[require 'lspsaga'.init_lsp_saga{
                                use_saga_diagnostic_sign = false,
                                -- code_action_icon = "✨",
                                }]],
            },
        },
        config = [[
                require 'dotfiles.lsp'
                require'lsp_extensions'.inlay_hints {
                highlight = "NonText",
                prefix = " » ",
                aligned = true,
                only_current_line = false,
                enabled = { "ChainingHint" }
                }
                ]],
    },
    { "norcalli/nvim-colorizer.lua", config = "require [[colorizer]].setup()" },
    { -- Treesitter
        { "nvim-treesitter/nvim-treesitter", config = [[require "dotfiles.plugins.treesitter"]] },
        "~/stuff/projects/nvim-ts-rainbow",
        "nvim-treesitter/nvim-treesitter-refactor", --  <--
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/playground",
        "vigoux/architext.nvim", -- <--
    },
    { "Olical/aniseed" },
    { -- Lisp
        {
            "Olical/conjure",
            ft = { "fennel", "clojure" },
            config = [[
                        vim.g["conjure#highlight#enabled"] = 1
                        vim.g["conjure#highlight#timeout"] = 500
                        vim.g["conjure#highlight#group"] = "IncSearch"
                        vim.g["conjure#mapping#doc_word"] = "K"
                        ]],
        },
        {
            "eraserhd/parinfer-rust",
            run = "cargo build --release",
            ft = { "clojure", "fennel", "lisp", "scheme" },
        },
    },
    "pbrisbin/vim-mkdir",
    "tpope/vim-surround",
    "tpope/vim-repeat", -- <--
    "b3nj5m1n/kommentary",
    { "reedes/vim-pencil", ft = { "txt", "markdown", "rst" } },
    { "rhysd/git-messenger.vim", cmd = "GitMessenger" },
    {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        setup = [[require "definitions"]],
        cond = function()
            return (vim.g.uivonim ~= 1 and vim.g.gonvim_running ~= 1)
        end,
    },
    "takac/vim-hardtime",
    "antoinemadec/FixCursorHold.nvim",
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
            "nvim-telescope/telescope-fzf-writer.nvim",
            "nvim-telescope/telescope-cheat.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-dap.nvim",
        },
        config = [[
                require "dotfiles.plugins.telescope.setup"
                require('telescope').load_extension('fzy_native')
                require('telescope').load_extension('gh')
                require'telescope'.load_extension('z')
                require'telescope'.load_extension("cheat")
                require'telescope'.load_extension('frecency')
                require'telescope'.load_extension('project')
                require'telescope'.load_extension('packer')
                require('telescope').load_extension('dap')
                ]],
    },
    { "mhartington/formatter.nvim", config = [[require "dotfiles.plugins.formatter"]] },
    { "oknozor/illumination", run = ".install.sh", ft = "markdown" },
    "wfxr/minimap.vim",
    { "iberianpig/tig-explorer.vim", requires = "rbgrouleff/bclose.vim" },
    { "TimUntersberger/neogit", config = [[require('neogit').setup{}]] },
    "andymass/vim-matchup",
    "KabbAmine/vCoolor.vim",
    { "lewis6991/gitsigns.nvim", config = [[require('gitsigns').setup{keymaps={}}]] },
    "mtdl9/vim-log-highlighting",
    { "glacambre/firenvim", run = ":call firenvim#install(0)" },
    "tjdevries/train.nvim",
    "junegunn/limelight.vim",
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
        { "tjdevries/manillua.nvim", ft = "lua" },
        { "tjdevries/nlua.nvim", ft = "lua" },
    },
    "tridactyl/vim-tridactyl",
    { "yonlu/omni.vim", setup = [[vim.o.termguicolors = true]] },
    "tversteeg/registers.nvim",
    "aouelete/sway-vim-syntax",
    "monaqa/dial.nvim",
    { "nacro90/numb.nvim", config = [[require('numb').setup()]] },
    { "sindrets/diffview.nvim", cmd = "DiffviewLoad" },
    {
        "akinsho/nvim-toggleterm.lua",
        config = [[require("toggleterm").setup()]],
    },
    { "folke/todo-comments.nvim", config = [[require "dotfiles.plugins.todo"]] },
    { "tjdevries/express_line.nvim", config = [[require "dotfiles.plugins.el"]] },
}
return packages
