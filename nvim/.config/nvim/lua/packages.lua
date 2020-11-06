local packages = {
  {'wbthomason/packer.nvim', opt = true, commit = '2aba863c46e786eb05198040773c593851d773d0'},
  {'Akin909/nvim-bufferline.lua', config = 'require [[bufferline]].setup()'},
  {'dense-analysis/ale'},
  {'dracula/vim', as = 'dracula'},
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
  {'liuchengxu/vim-which-key'},
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
      'nvim-lua/lsp-status.nvim',
      'nvim-lua/diagnostic-nvim'
    },
    config = {'require [[ls_setup]]'}
  },
  {'mfussenegger/nvim-jdtls', opt = true},
  {'norcalli/nvim-colorizer.lua', config = {'require [[colorizer]].setup()'}},
  {
    'nvim-treesitter/nvim-treesitter',
    commit = '9327b113c2360d503ab183718c57e3e1b0819887',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects'
    }
  },
  {'nvim-treesitter/playground'},
  {'romgrk/nvim-treesitter-context'},
  {'Olical/aniseed', config = [[require('aniseed.env').init({ module = 'dotfiles.init' })]], branch = 'develop'},
  {'Olical/conjure', ft = {'fennel', 'clojure'}, tag = 'v4.8.0'},
  {'pbrisbin/vim-mkdir'},
  {'psliwka/vim-smoothie'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-surround'},
  {'tyru/caw.vim'},
  {'reedes/vim-pencil', ft = {'txt', 'markdown', 'rst'}},
  {'rhysd/git-messenger.vim'},
  {
    'vigoux/LanguageTool.nvim'
    --TODO    ft = {},
  },
  {'Yggdroot/indentLine', requires = {'lukas-reineke/indent-blankline.nvim'}},
  {'takac/vim-hardtime'},
  {'vigoux/architext.nvim'},
--  {'glepnir/galaxyline.nvim',
--    branch = 'main'
--  },
  {'tjdevries/express_line.nvim', config = 'require [[expressline_setup]]'},
  {'antoinemadec/FixCursorHold.nvim'},
  {'voldikss/vim-floaterm'},
  {
    'nvim-lua/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'mhartington/formatter.nvim',
    config = {
      [[
        require('format').setup({
          lua = {
              luafmt = function()
                return {
                  exe = 'luafmt',
                  args = {'--indent-count', 2, '--stdin'},
                  stdin = true
                }
              end
            }
        })
      ]]
    }
  },
  {'nvim-treesitter/completion-treesitter'},
  {'ThePrimeagen/vim-be-good'},
  {'npxbr/glow.nvim', run = ':GlowInstall', ft = 'markdown'},
  {'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = [[require('gitsigns').setup()]],
    branch = 'main'
  },
  {
    'smolck/nvim-todoist.lua',
    requires = 'nvim-lua/plenary.nvim',
    config = 'require[[nvim-todoist]].neovim_stuff.use_defaults()'
  },
  {'wfxr/minimap.vim'},
--  {'romgrk/lister', run = 'npm install'}
  {'git@github.com:p00f/nvim-ts-rainbow.git'}
}

return packages
