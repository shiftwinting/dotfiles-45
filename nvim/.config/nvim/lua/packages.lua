local packages = {
        { "wbthomason/packer.nvim", opt = true },
        {
                "Akin909/nvim-bufferline.lua",
                config = "require [[bufferline]].setup({options={separator_style='slant'}})",
        },
        "dense-analysis/ale",
        "editorconfig/editorconfig-vim",
        "hardcoreplayers/dashboard-nvim",
        "jeffkreeftmeijer/vim-numbertoggle",
        "jiangmiao/auto-pairs",
        "justinmk/vim-gtfo", -- <--
        { "kyazdani42/nvim-tree.lua" },
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
                        {
                                "mfussenegger/nvim-dap",
                                { "rcarriga/nvim-dap-ui", config = 'require("dapui").setup()' },
                        },
                        -- "theHamsta/nvim-dap-virtual-text",
                        {
                                "onsails/lspkind-nvim",
                                cond = function()
                                        return vim.g.uivonim ~= 1
                                end,
                                config = "require 'lspkind_setup'",
                        },
                        {
                                "glepnir/lspsaga.nvim",
                                cond = function()
                                        return vim.g.uivonim ~= 1
                                end,
                                config = [[require 'lspsaga'.init_lsp_saga{
                                use_saga_diagnostic_sign = false,
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
                --"kil0meters/nvim-ts-rainbow",
                "~/stuff/projects/nvim-ts-rainbow",
                "nvim-treesitter/nvim-treesitter-refactor",
                "nvim-treesitter/nvim-treesitter-textobjects", -- <--
                "nvim-treesitter/playground",
                "haringsrob/nvim_context_vt",
                "vigoux/architext.nvim", -- <--
                -- "romgrk/nvim-treesitter-context",
        },
        {
                "Olical/aniseed",
                config = [[require('aniseed.env').init({ module = 'dotfiles.init' })]],
        },
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
                { "clojure-vim/vim-jack-in", ft = "clojure" },
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
        "rhysd/git-messenger.vim",
        {
                "lukas-reineke/indent-blankline.nvim",
                branch = "lua",
                cond = function()
                        return (
                                        vim.g.uivonim ~= 1
                                        and vim.g.gonvim_running ~= 1
                                        and vim.g.neovide ~= true
                                )
                end,
        },
        "takac/vim-hardtime",
        { "glepnir/galaxyline.nvim", config = "require [[statusline]]" },
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
                        "nvim-telescope/telescope-cheat.nvim",
                        "nvim-telescope/telescope-project.nvim",
                        "nvim-telescope/telescope-arecibo.nvim",
                        --  "nvim-telescope/telescope-dap.nvim",
                },
                rocks = { "openssl", "lua-http-parser" },
                config = [[
                require "telescope_setup"
                require('telescope').load_extension('fzy_native')
                require('telescope').load_extension('gh')
                require'telescope'.load_extension('z')
                require'telescope'.load_extension("cheat")
                require'telescope'.load_extension('frecency')
                require'telescope'.load_extension('project')
                require 'telescope'.load_extension("arecibo")
                --  require('telescope').load_extension('dap')
                ]],
        },
        "mhartington/formatter.nvim",
        { "oknozor/illumination", run = ".install.sh", ft = "markdown" },
        "wfxr/minimap.vim",
        { "iberianpig/tig-explorer.vim", requires = "rbgrouleff/bclose.vim" },
        { "TimUntersberger/neogit", config = [[require('neogit').setup{}]] },
        "andymass/vim-matchup",
        "KabbAmine/vCoolor.vim",
        { "lewis6991/gitsigns.nvim", config = [[require('gitsigns').setup{keymaps={}}]] },
        "mtdl9/vim-log-highlighting",
        { "glacambre/firenvim", run = ":call firenvim#install(0)" },
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
        "tversteeg/registers.nvim",
        {
                "edluffy/specs.nvim",
                cond = function()
                        return vim.g.neovide ~= true
                end,
                config = [[require('specs').setup{}]],
        },
        "aouelete/sway-vim-syntax",
        "monaqa/dial.nvim",
        { "nacro90/numb.nvim", config = [[require('numb').setup()]] },
        { "sunjon/shade.nvim", config = [[require "shade".setup()]] },
        { "folke/lsp-trouble.nvim", config = [[require("trouble").setup()]] },
}

return packages
