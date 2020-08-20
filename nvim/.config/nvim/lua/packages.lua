local packages = {
  {'wbthomason/packer.nvim'},
  {'Akin909/nvim-bufferline.lua', config = 'require [[bufferline]].setup()'},
  {'bakpakin/fennel.vim'},
  {'camspiers/lens.vim', requires = {'camspiers/animate.vim'}},
  {'dense-analysis/ale'},
  {'dracula/vim', as = 'dracula'},
  {'editorconfig/editorconfig-vim'},
  {'guns/vim-sexp',
   ft = {'clj', 'fnl'},
   requires = {'tpope/vim-sexp-mappings-for-regular-people'}
  },
  {'hardcoreplayers/dashboard-nvim',
    cond = function() return vim.g.gnvim ~= 1 end
  },
  {'iamcco/markdown-preview.nvim',
    ft = {'md', 'mkdn', 'markdown'},
    config = {'vim.cmd[[doautocmd BufEnter]]'
      },
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  },
  {'jeffkreeftmeijer/vim-numbertoggle'},
  {'jiangmiao/auto-pairs'},
  {'justinmk/vim-gtfo'},
  {'justinmk/vim-sneak'},
  {'kassio/neoterm', cmd = {'Tnew'}},
--  {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}},
  {'ms-jpq/chadtree',
    branch = 'chad',
--    run = 'vim.cmd[[UpdateRemotePlugins]]'
  },
  {'liuchengxu/vim-clap',
    cond = function() return vim.g.gnvim ~= 1 end,
    run = ':Clap install-binary<CR>'
  },
  {'liuchengxu/vista.vim'},
  {'liuchengxu/vim-which-key'},
  {'mattn/vim-sonictemplate', cmd = 'Template'},
--  {'mhinz/vim-signify'},              (gitgutter for spaceline, signify for airline)
  {'mhinz/vim-startify',
    cond = function() return vim.g.gnvim == 1 end
  },
  {'nvim-lua/completion-nvim',
    requires = {
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
        {'aca/completion-tabnine', run = './install.sh'},
        {'ncm2/float-preview.nvim', cond = function() return ((vim.g.gonvim_running ~= 1) and (vim.g.gnvim ~=1)) end }
      }
  },
  {'neovim/nvim-lsp',
    requires = {'nvim-lua/lsp-status.nvim', 'nvim-lua/diagnostic-nvim'},
    config = {'require [[nvim_lsp]].bashls.setup{}',
      'require [[nvim_lsp]].jdtls.setup{}',
      'require [[nvim_lsp]].vimls.setup{}',
      'require [[nvim_lsp]].sumneko_lua.setup{cmd={"/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/p00f/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua" };}'
    }
  },
  {'norcalli/nvim-colorizer.lua',
   config = {'require [[colorizer]].setup()'},
   cmd = 'ColorizerLoad'},
  {'p00f/nvim-treesitter', config = 'require [[treesitter_setup]]'},
  {'nvim-treesitter/playground'},
  {'Olical/aniseed', config='require [[aniseed.dotfiles]]', tag = 'v3.6.1'},
  {'Olical/conjure', ft = {'fnl', 'clj', 'fennel', 'clojure'}, tag = 'v4.3.1'},
  {'pbrisbin/vim-mkdir'},
  {'psliwka/vim-smoothie'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-surround'},
  {'tyru/caw.vim'},
  {'reedes/vim-pencil', ft = {'txt', 'md', 'mkdn', 'rst'}},
  {'rhysd/git-messenger.vim'},
--TODO  'skywind3000/vim-quickui',
  {'vigoux/LanguageTool.nvim',
--TODO    ft = {},
  },
  {'vim-airline/vim-airline'},
--  {'hardcoreplayers/spaceline.vim', requires = {'airblade/vim-gitgutter'}},
  {'Yggdroot/indentLine', requires = {'lukas-reineke/indent-blankline.nvim'}},
  {'ryanoasis/vim-devicons'},
  {'takac/vim-hardtime'},
  {'puremourning/vimspector', tag = '1835'}
}

return packages
