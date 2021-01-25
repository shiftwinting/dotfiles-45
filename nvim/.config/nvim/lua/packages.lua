local packages = {
  {'wbthomason/packer.nvim', opt = true},
  {'Akin909/nvim-bufferline.lua', config = 'require [[bufferline]].setup()'},
  {'dense-analysis/ale'},
  {'dracula/vim', as = 'dracula'},
  {'axvr/photon.vim'},
  {'editorconfig/editorconfig-vim'},
  {
    'guns/vim-sexp',
    ft = {'clojure', 'fennel'},
    requires = {'tpope/vim-sexp-mappings-for-regular-people'}
  },
  {'hardcoreplayers/dashboard-nvim'},
  {'jeffkreeftmeijer/vim-numbertoggle'},
  {'jiangmiao/auto-pairs'},
  {'justinmk/vim-gtfo'},
  {'justinmk/vim-sneak'},
  {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'},
  {'liuchengxu/vista.vim'},
  {'mattn/vim-sonictemplate', cmd = 'Template'},
  {
    'nvim-lua/completion-nvim',
    requires = {
      {'aca/completion-tabnine', run = './install.sh'},
      {
        'ncm2/float-preview.nvim',
        cond = function()
          return vim.g.gnvim ~= 1 and vim.g.uivonim ~= 1
        end
      },
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ'
    }
  },
  {
    'neovim/nvim-lspconfig',
    requires = {
      'nvim-lua/lsp-status.nvim'
    },
    config = {'require [[ls_setup]]'}
  },
  {'mfussenegger/nvim-jdtls', opt = true},
  {'mfussenegger/nvim-dap'},
  {'norcalli/nvim-colorizer.lua', config = {'require [[colorizer]].setup()'}},
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/completion-treesitter'
    }
  },
  {'nvim-treesitter/playground'},
  {'romgrk/nvim-treesitter-context'},
  {'Olical/aniseed', config = [[require('aniseed.env').init({ module = 'dotfiles.init' })]]},
  {'Olical/conjure', ft = {'fennel', 'clojure'}},
  {'pbrisbin/vim-mkdir'},
  {'yuttie/comfortable-motion.vim',
        cond = function()
          return (vim.g.neovide ~= true and vim.g.gonvim_running ~=1)
        end
  },
  {'tpope/vim-fugitive'},
  {'tpope/vim-surround'},
  {'tyru/caw.vim'},
  {'reedes/vim-pencil', ft = {'txt', 'markdown', 'rst'}},
  {'rhysd/git-messenger.vim'},
  {'Yggdroot/indentline', requires = 'lukas-reineke/indent-blankline.nvim'},
  {'takac/vim-hardtime'},
  {'vigoux/architext.nvim'},
  {'tjdevries/express_line.nvim', config = 'require [[expressline_setup]]'},
  {'antoinemadec/FixCursorHold.nvim'},
  {'numtostr/FTerm.nvim'},
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
  {'mhartington/formatter.nvim'},
  {'ThePrimeagen/vim-be-good'},
  {'npxbr/glow.nvim', run = ':GlowInstall', ft = 'markdown'},
  {'wfxr/minimap.vim'},
  {'kdheepak/lazygit.nvim'},
  {'git@github.com:p00f/nvim-ts-rainbow'},
  {'andymass/vim-matchup'},
  {'KabbAmine/vCoolor.vim'},
  {'lewis6991/gitsigns.nvim', config = [[require('gitsigns').setup()]]},
  {'vigoux/oak'},
  {'bakpakin/fennel.vim'},
  {'nvim-telescope/telescope-fzy-native.nvim'},
  {'mtdl9/vim-log-highlighting'},
  {'ElPiloto/sidekick.nvim'},
  {'glacambre/firenvim', run = ':call firenvim#install(0)'},
  {'eraserhd/parinfer-rust', run = 'cargo build --release'},
  {'luochen1990/rainbow'},
  {'notomo/helpeek.vim'},
  {'clojure-vim/vim-jack-in', ft = 'clojure'},
  {'timeyyy/orchestra.nvim',
    run = [[
      :call orchestra#prelude()<CR>:call orchestra#set_tune('clackclack')<CR>
    ]]
  },
  {'junegunn/limelight.vim'},
  {'oberblastmeister/neuron.nvim',
      config = [[
        require'neuron'.setup {
          virtual_titles = true,
          mappings = true,
          run = nil, -- function to run when in neuron dir
          neuron_dir = "~/neuron"
        }
    ]]
  }
}



return packages
