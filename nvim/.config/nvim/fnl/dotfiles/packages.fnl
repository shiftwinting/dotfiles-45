(module dotfiles.packages
        {require {packer packer}})

(local packages
 {:wbthomasson/packer.nvim {}
  :Olical/aniseed {}
  :Akin909/nvim-bufferline.lua {:config "require 'bufferline'.setup()"}
  :dense-analysis/ale {:config "require 'dotfiles.plugins.ale'"}
  :editorconfig/editorconfig-vim {}
  :hardcoreplayers/dashboard-nvim {:config "require 'dotfiles.plugins.dashboard'"}
  :jeffkreeftmeijer/vim-numbertoggle {}
  :jiangmiao/auto-pairs {}
  :tpope/vim-sleuth {}
  :justinmk/vim-gtfo {}
  :yamatsum/nvim-nonicons {:requires "kyazdani42/nvim-web-devicons"
                           :config "require 'nvim-nonicons'"}
  :norcalli/nvim-colorizer.lua {:config "require 'colorizer'.setup()"}

; Completion
  :hrsh7th/nvim-compe {:config "require 'dotfiles.plugins.compe'"}
  :tami5/compe-conjure {:after "conjure"}
  :tamago324/compe-zsh {}
  :tzachar/compe-tabnine {:run "./install.sh"}
; LSP
  :neovim/nvim-lspconfig {:config "require 'dotfiles.lsp'"}
  :nvim-lua/lsp_extensions.nvim {:config
                                 "require'lsp_extensions'.inlay_hints {prefix =  '»'}"}
  :nvim-lua/lsp-status.nvim {}
  :folke/lsp-trouble.nvim {:config "require 'trouble'.setup()"}
  :onsails/lspkind-nvim {:cond (fn [] (not (= 1 vim.g.uivonim)))
                         :config "require 'dotfiles.plugins.lspkind'"}
  ;TODO: lspsaga or alternatives

; DAP
  :mfussenegger/nvim-dap {:config "require 'dotfiles.plugins.dap.setup'"
                          :opt true}
  :rcarriga/nvim-dap-ui {:config "require 'dapui'.setup()"
                         :after "nvim-dap"}

; Treesitter
  :nvim-treesitter/nvim-treesitter {:config "require 'dotfiles.plugins.treesitter'"}
  "~/stuff/projects/nvim-ts-rainbow" {}
  :nvim-treesitter/nvim-treesitter-refactor {}
  :nvim-treesitter/nvim-treesitter-textobjects {}
  :nvim-treesitter/playground {}
  :vigoux/architext.nvim {}
  :Olical/conjure {:ft ["fennel" "clojure"]}
  :eraserhd/parinfer-rust {:run "cargo build --release"
                           :ft ["clojure" "fennel" "lisp" "scheme"]}
  :pbrisbin/vim-mkdir {}
  :tpope/vim-surround {}
  :tpope/vim-repeat {}
  :b3nj5m1n/kommentary {}
  :reedes/vim-pencil {:ft ["txt" "makrdown"]}
  :lukas-reineke/indent-blankline.nvim {:branch "lua"
                                        :setup "require 'dotfiles.definitions'"
                                        :cond (fn [] (and (not= 1 vim.g.uivonim)
                                                          (not= 1 vim.g.gonvim_running)))}
  :takac/vim-hardtime {}
  :antoinemadec/FixCursorHold.nvim {}
  :mhartington/formatter.nvim {:config "require 'dotfiles.plugins.formatter'"}
  :oknozor/illumination {:run "./insttall.sh"
                         :ft "markdown"}
; Git
  :iberianpig/tig-explorer.vim {:requires "rbgrouleff/bclose.vim"}
  :TimUntersberger/neogit {:config "require 'neogit'.setup()"
                           :cmd "Neogit"}
  :tanvirtin/vgit.nvim {:config "require 'vgit'.setup{blames_enabled=false}"}

  :andymass/vim-matchup {}
  :KabbAmine/vCoolor.vim {}
  :mtdl9/vim-log-highlighting {}
  :junegunn/limelight.vim {}
  :tkmpypy/chowcho.nvim {}
  :phaazon/hop.nvim {}
  :alx741/neoman.vim {:cmd "Neoman"}
  "~/stuff/projects/cphelper/cphelper.nvim" {:rocks "http"
                                             :requires "nvim-lua/plenary.nvim"}
  :mhinz/vim-sayonara {}
  :delphinus/vim-auto-cursorline {}
  :omrisarig13/vim-auto-abbrev {}
  :axelf4/vim-strip-trailing-whitespace {}
  :tjdevries/nlua.nvim {:ft "lua"}
  :tridactyl/vim-tridactyl {}
  :yonlu/omni.vim {:setup "vim.o.termguicolors = true"}
  :tversteeg/registers.nvim {}
  :aouelete/sway-vim-syntax {}
  :monaqa/dial.nvim {}
  :nacro90/numb.nvim {:config "require 'numb'.setup()"}
  :sindrets/diffview.nvim {:cmd "DiffviewLoad"}
  :akinsho/nvim-toggleterm.lua {:config "require 'toggleterm'.setup()"}
  :folke/todo-comments.nvim {:config "require 'dotfiles.plugins.todo'"}
  :tjdevries/express_line.nvim {:config "require 'dotfiles.plugins.el'"}

  ; Telescope
  :nvim-telescope/telescope.nvim {:config "require 'dotfiles.plugins.telescope.setup'"}
  :nvim-lua/popup.nvim {}
  :nvim-telescope/telescope-fzy-native.nvim {:config "require 'telescope'.load_extension('fzy_native')"}
  :nvim-telescope/telescope-z.nvim {:config "require 'telescope'.load_extension('z')"}
  :nvim-telescope/telescope-frecency.nvim {:requires "tami5/sql.nvim"
                                           :config "require'telescope'.load_extension('frecency')"}
  :nvim-telescope/telescope-fzf-writer.nvim {}
  :nvim-telescope/telescope-project.nvim {:config "require'telescope'.load_extension('project')"}
  :nvim-telescope/telescope-dap.nvim {:config "require 'telescope'.load_extension('dap')"
                                      :after "nvim-dap"}})

(packer.startup (fn []
                   (each [key value (pairs packages)]
                      (let [p {1 key}]
                         (use (vim.tbl_deep_extend "error" p value))))))
