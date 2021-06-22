(module dotfiles.packages
        {require {packer packer}})

(local packages
 {:wbthomason/packer.nvim {}
  :Olical/aniseed {}
  :jose-elias-alvarez/buftabline.nvim {:config "require('buftabline').setup{
                                                  icons = true,
                                                  icon_colors = true,
                                                  hlgroup_normal = 'BufferlineNonCurrent',
                                                }"}
  :dense-analysis/ale {:config "require 'dotfiles.plugins.ale'"}
  :editorconfig/editorconfig-vim {}
  :hardcoreplayers/dashboard-nvim {:config "require 'dotfiles.plugins.dashboard'"}
  :jeffkreeftmeijer/vim-numbertoggle {}
  :jiangmiao/auto-pairs {}
  :tpope/vim-sleuth {}
  :justinmk/vim-gtfo {}
  :matbme/JABS.nvim {}
  :yamatsum/nvim-nonicons {:requires "kyazdani42/nvim-web-devicons"
                           :config "require 'nvim-nonicons'"}
  :norcalli/nvim-colorizer.lua {:config "require 'colorizer'.setup()"
                                :cmd "ColorizerToggle"}

; Completion
  :hrsh7th/nvim-compe {:config "require 'dotfiles.plugins.compe'"}
  :tami5/compe-conjure {:after "conjure"}
  :tamago324/compe-zsh {}
  :norcalli/snippets.nvim {:config "require 'dotfiles.snippets'"}

; LSP
  :neovim/nvim-lspconfig {:config "require 'dotfiles.lsp'"}
  :nvim-lua/lsp-status.nvim {}
  :folke/lsp-trouble.nvim {:config "require 'trouble'.setup()"
                           :cmd "Trouble"}
  :onsails/lspkind-nvim {:cond (fn [] (not (= 1 vim.g.uivonim)))
                         :config "require 'dotfiles.plugins.lspkind'"}
  :glepnir/lspsaga.nvim {}
  :simrat39/symbols-outline.nvim {:cmd "SymbolsOutline"}
  :simrat39/rust-tools.nvim {}
  ;TODO: lspsaga or alternatives

; DAP
  :mfussenegger/nvim-dap {:config "require 'dotfiles.plugins.dap.setup'"
                          :opt false}
  :theHamsta/nvim-dap-virtual-text {:config "vim.g.dap_virtual_text = true"}

; Treesitter
  :nvim-treesitter/nvim-treesitter {:config "require 'dotfiles.plugins.treesitter'"
                                    :run ":TSUpdate"}
  "~/stuff/projects/nvim-ts-rainbow" {:branch "incremental_updates"}
  :nvim-treesitter/nvim-treesitter-refactor {}
  :nvim-treesitter/nvim-treesitter-textobjects {}
  :nvim-treesitter/playground {}
  :vigoux/architext.nvim {}
  :mfussenegger/nvim-ts-hint-textobject {}

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
  :mhartington/formatter.nvim {:config "require 'dotfiles.plugins.formatter'"
                               :cmd "Format"}
  :oknozor/illumination {:run "./install.sh"
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
  :chrisbra/NrrwRgn {}
  :tkmpypy/chowcho.nvim {}
  :phaazon/hop.nvim {:config "require 'hop'.setup{}"}
  "~/stuff/projects/cphelper/cphelper.nvim" {:rocks "http"
                                             :requires "nvim-lua/plenary.nvim"}
  :mhinz/vim-sayonara {}
  :delphinus/vim-auto-cursorline {}
  :lewis6991/foldsigns.nvim {:config "require 'foldsigns'.setup()"}
  :omrisarig13/vim-auto-abbrev {}
  :axelf4/vim-strip-trailing-whitespace {}
  :folke/lua-dev.nvim {}
  :tridactyl/vim-tridactyl {}
  :yonlu/omni.vim {:setup "vim.o.termguicolors = true"}
  :tversteeg/registers.nvim {}
  :aouelete/sway-vim-syntax {}
  :monaqa/dial.nvim {}
  :nacro90/numb.nvim {:config "require 'numb'.setup()"}
  :sindrets/diffview.nvim {:cmd "DiffviewLoad"}
  :akinsho/nvim-toggleterm.lua {:config "require 'toggleterm'.setup()"
                                :cmd "ToggleTerm"}
  :folke/todo-comments.nvim {:config "require 'dotfiles.plugins.todo'"}
  :folke/lsp-colors.nvim {}
  :tjdevries/express_line.nvim {:config "require 'dotfiles.plugins.el'"}
  :sayanarijit/xplr.vim {:cmd "XplrPicker"}

  ; Telescope
  :nvim-telescope/telescope.nvim {:config "require 'dotfiles.plugins.telescope.setup'"}
  :cwebster2/github-coauthors.nvim {:config "require('telescope').load_extension('githubcoauthors')"}
  :nvim-telescope/telescope-fzf-native.nvim {:run "make"
                                             :config "require('telescope').load_extension('fzf')"
                                             :after "telescope.nvim"}
  :nvim-lua/popup.nvim {}
  :nvim-telescope/telescope-z.nvim {:config "require 'telescope'.load_extension('z')"}
  :nvim-telescope/telescope-frecency.nvim {:requires "tami5/sql.nvim"
                                           :config "require'telescope'.load_extension('frecency')"}
  :nvim-telescope/telescope-fzf-writer.nvim {}
  :nvim-telescope/telescope-project.nvim {:config "require'telescope'.load_extension('project')"}
  :nvim-telescope/telescope-dap.nvim {:config "require 'telescope'.load_extension('dap')"
                                      :after "nvim-dap"}
  :wfxr/minimap.vim {:cmd "Minimap"}

  :mhinz/neovim-remote {}})

(packer.startup (fn []
                   (each [key value (pairs packages)]
                      (let [p {1 key}]
                         (use (vim.tbl_deep_extend "error" p value))))))
