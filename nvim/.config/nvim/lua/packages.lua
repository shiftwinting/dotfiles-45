local packages = {
  {'wbthomason/packer.nvim', opt = true},
  {'Akin909/nvim-bufferline.lua', config = 'require [[bufferline]].setup()'},
  'dense-analysis/ale',
  'christianchiarulli/nvcode-color-schemes.vim',
  'editorconfig/editorconfig-vim',
  {
    'guns/vim-sexp',
    ft = {'clojure', 'fennel'},
    requires = {'tpope/vim-sexp-mappings-for-regular-people'}
  },
  'hardcoreplayers/dashboard-nvim',
  'jeffkreeftmeijer/vim-numbertoggle',
  'jiangmiao/auto-pairs',
  'justinmk/vim-gtfo',
  {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'},
  'liuchengxu/vista.vim',
  {'mattn/vim-sonictemplate', cmd = 'Template'},
  {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',
      {'tami5/compe-conjure', after = 'conjure'},
      'tamago324/compe-zsh',
      {'tzachar/compe-tabnine', run = './install.sh'}
    }
  },
  {
    'neovim/nvim-lspconfig',
    requires = {
      'nvim-lua/lsp-status.nvim',
      {'onsails/lspkind-nvim', cond = function() return vim.g.uivonim ~=1 end,
        config = [[require('lspkind').init()]]},
      {'glepnir/lspsaga.nvim', cond = function() return vim.g.uivonim ~=1 end,
        config = [[require 'lspsaga'.init_lsp_saga()]]}
    },
    config = {[[
      require "ls_setup"
    ]]}
  },
  {'kosayoda/nvim-lightbulb', config = "vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]"},
  'mfussenegger/nvim-dap',
  {'norcalli/nvim-colorizer.lua', config = {'require [[colorizer]].setup()'}},
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects'
    }
  },
  'nvim-treesitter/playground',
  'romgrk/nvim-treesitter-context',
  'wellle/context.vim',
  {'Olical/aniseed', config = [[require('aniseed.env').init({ module = 'dotfiles.init' })]]},
  {'Olical/conjure', ft = {'fennel', 'clojure'}},
  'pbrisbin/vim-mkdir',
  {'yuttie/comfortable-motion.vim',
    cond = function()
      return (vim.g.neovide ~= true and vim.g.gonvim_running ~=1)
    end
  },
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tyru/caw.vim',
  {'reedes/vim-pencil', ft = {'txt', 'markdown', 'rst'}},
  'rhysd/git-messenger.vim',
  {'lukas-reineke/indent-blankline.nvim', branch = 'lua', cond = function() return vim.g.uivonim ~=1 end},
  'takac/vim-hardtime',
--  'vigoux/architext.nvim',
  {'tjdevries/express_line.nvim', config = 'require [[expressline_setup]]'},
--  {'glepnir/galaxyline.nvim', config = 'require [[eviline]]'},
  'antoinemadec/FixCursorHold.nvim',
  'numtostr/FTerm.nvim',
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-packer.nvim',
      'nvim-telescope/telescope-github.nvim'
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
    ]]
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    requires = 'tami5/sql.nvim',
    config = function()
      require'telescope'.load_extension('frecency')
    end
  },
  'mhartington/formatter.nvim',
  {'oknozor/illumination', run = '.install.sh', ft = 'markdown'},
  'wfxr/minimap.vim',
  'kdheepak/lazygit.nvim',
  'git@github.com:p00f/nvim-ts-rainbow',
  'andymass/vim-matchup',
  'KabbAmine/vCoolor.vim',
  {'lewis6991/gitsigns.nvim', config = [[require('gitsigns').setup{keymaps={}}]]},
  'nvim-telescope/telescope-fzy-native.nvim',
  'mtdl9/vim-log-highlighting',
  'ElPiloto/sidekick.nvim',
  {'glacambre/firenvim', run = ':call firenvim#install(0)'},
  {'eraserhd/parinfer-rust', run = 'cargo build --release', ft = {'clojure', 'fennel', 'emacs lisp', 'lisp', 'scheme'}},
  'luochen1990/rainbow',
  'notomo/helpeek.vim',
  {'clojure-vim/vim-jack-in', ft = 'clojure'},
  'tjdevries/train.nvim',
  'junegunn/limelight.vim',
  'brooth/far.vim',
  'tkmpypy/chowcho.nvim',
  'phaazon/hop.nvim',
  {'alx741/neoman.vim', cmd = 'Neoman'},
  'andweeb/presence.nvim',
  {'~/stuff/projects/cphelper/cphelper.nvim', rocks = {'http', 'lunajson', 'luafilesystem'}, requires = 'nvim-lua/plenary.nvim'},
  'mhinz/vim-sayonara',
  'delphinus/vim-auto-cursorline',
  'omrisarig13/vim-auto-abbrev',
  'axelf4/vim-strip-trailing-whitespace',
  'searleser97/cpbooster.vim',
  {
    {'rafcamlet/nvim-luapad', ft = 'lua'},
    --{'euclidianAce/BetterLua.vim', ft = 'lua'},
    {'tjdevries/manillua.nvim', ft = 'lua'},
    {'tjdevries/nlua.nvim', ft = 'lua'}
  },
  {'tridactyl/vim-tridactyl'},
--'vigoux/oak',
  'npxbr/gruvbox.nvim',
  'yonlu/omni.vim'
}

return packages
