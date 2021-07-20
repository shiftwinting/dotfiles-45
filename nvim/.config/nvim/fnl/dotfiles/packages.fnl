(module dotfiles.packages
        {require {packer packer}})

(local groups
  {:completion
     {:hrsh7th/nvim-compe {:config "require 'dotfiles.plugins.compe'"}
      :tami5/compe-conjure {:after "conjure"}
      :norcalli/snippets.nvim {:config "require 'dotfiles.snippets'"}}

   :lsp
     {:neovim/nvim-lspconfig {:config "require 'dotfiles.lsp'"}
      :nvim-lua/lsp-status.nvim {}
      :folke/lsp-trouble.nvim {:config "require 'trouble'.setup { use_lsp_diagnostic_signs = true }"
                               :cmd "Trouble"}
      :onsails/lspkind-nvim {:cond (fn [] (not (= 1 vim.g.uivonim)))
                             :config "require 'dotfiles.plugins.lspkind'"}
      :simrat39/symbols-outline.nvim {:cmd "SymbolsOutline"}
      :simrat39/rust-tools.nvim {}
      :jose-elias-alvarez/nvim-lsp-ts-utils {}
      :folke/lua-dev.nvim {}
      :ray-x/lsp_signature.nvim {:config "require 'lsp_signature'.on_attach()"}
      :kosayoda/nvim-lightbulb {}}

   :dap
     {:mfussenegger/nvim-dap {:config "require 'dotfiles.plugins.dap.setup'"}
      :theHamsta/nvim-dap-virtual-text {:config "vim.g.dap_virtual_text = true"}}

   :treesitter
     {:nvim-treesitter/nvim-treesitter {:config "require 'dotfiles.plugins.treesitter'"
                                        :run ":TSUpdate"}
      "~/stuff/projects/nvim-ts-rainbow" {}
      :nvim-treesitter/nvim-treesitter-refactor {}
      :nvim-treesitter/nvim-treesitter-textobjects {}
      :nvim-treesitter/playground {}
      :nvim-treesitter/nvim-tree-docs {}}

   :git
     {:TimUntersberger/neogit {:config "require 'neogit'.setup {integrations = { diffview = true }}"}
      :lewis6991/gitsigns.nvim {:config "require 'gitsigns'.setup { keymaps = {} }"}
      :sindrets/diffview.nvim {:cmd "DiffviewOpen"}}

   :telescope
     {:nvim-telescope/telescope.nvim {:config "require 'dotfiles.plugins.telescope.setup'
                                               require('telescope').load_extension('fzf')"}
      :nvim-telescope/telescope-fzf-native.nvim {:run "make"} ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      :nvim-lua/popup.nvim {}
      :nvim-telescope/telescope-z.nvim {:config "require 'telescope'.load_extension('z')"}
      :nvim-telescope/telescope-frecency.nvim {:requires "tami5/sql.nvim"
                                               :config "require'telescope'.load_extension('frecency')"}
      :nvim-telescope/telescope-fzf-writer.nvim {} ;;;;;;;;;;;;;;;;;;;;;
      :nvim-telescope/telescope-project.nvim {:config "require'telescope'.load_extension('project')"}
      :nvim-telescope/telescope-dap.nvim {:config "require 'telescope'.load_extension('dap')"
                                          :after "nvim-dap"}}

   :editing
     {:tpope/vim-surround {}
      :AndrewRadev/splitjoin.vim {}
      :jiangmiao/auto-pairs {}
      :tpope/vim-repeat {}
      :b3nj5m1n/kommentary {}
      :junegunn/vim-easy-align {}
      :monaqa/dial.nvim {}
      :folke/twilight.nvim {:config "require 'twilight'.setup{}"
                            :cmd "Twilight"}
      :andymass/vim-matchup {}
      :takac/vim-hardtime {}
      :wfxr/minimap.vim {:cmd "Minimap"}
      :omrisarig13/vim-auto-abbrev {}
      :nacro90/numb.nvim {:config "require 'numb'.setup()"}
      :phaazon/hop.nvim {:config "require 'hop'.setup{}"}
      :lukas-reineke/indent-blankline.nvim {:setup "require 'dotfiles.definitions'"
                                            :cond (fn [] (not= 1 vim.g.uivonim))}
      :lewis6991/foldsigns.nvim {:config "require 'foldsigns'.setup()"}}

   :visual
     {:jeffkreeftmeijer/vim-numbertoggle {}
      :jose-elias-alvarez/buftabline.nvim {:config "require('buftabline').setup {
                                                      icons = true,
                                                      icon_colors = true,
                                                      hlgroup_current = 'BufferlineCurrent',
                                                      hlgroup_normal = 'BufferlineNormal',
                                                    }"}
      :yamatsum/nvim-nonicons {:requires "kyazdani42/nvim-web-devicons"
                               :config "require 'nvim-nonicons'"}
      :norcalli/nvim-colorizer.lua {:config "require 'colorizer'.setup()"
                                    :cmd "ColorizerToggle"}
      :folke/todo-comments.nvim {:config "require 'dotfiles.plugins.todo'"}
      :delphinus/vim-auto-cursorline {}
      :mhinz/vim-startify {:config "require 'dotfiles.plugins.startify'"}
      :elianiva/icy.nvim {:requires "rktjmp/lush.nvim"
                          :setup "vim.o.termguicolors = true"}}

   :environment
     {:editorconfig/editorconfig-vim {}
      :tpope/vim-sleuth {}
      :airblade/vim-rooter {}}

   :file_nav
     {:matbme/JABS.nvim {}
      :tkmpypy/chowcho.nvim {}
      :sayanarijit/xplr.vim {:cmd "XplrPicker"}
      :kyazdani42/nvim-tree.lua {}}

   :misc
     {:wbthomason/packer.nvim {}
      :Olical/aniseed {}
      :Olical/conjure {:ft ["fennel" "clojure"]
                       :branch "master"}
      :eraserhd/parinfer-rust {:run "cargo build --release"
                               :ft ["clojure" "fennel" "lisp" "scheme"]}
      :dense-analysis/ale {:config "require 'dotfiles.plugins.ale'"}
      :kristijanhusak/orgmode.nvim {:config "require 'orgmode'.setup {
                                               org_agenda_files = { '~/org/notes/*' },
                                               org_default_notes_file = { '~/org/refile.org' },
                                             }"}
      :justinmk/vim-gtfo {}
      :pbrisbin/vim-mkdir {}
      :antoinemadec/FixCursorHold.nvim {}
      :mhartington/formatter.nvim {:config "require 'dotfiles.plugins.formatter'"
                                   :cmd ["Format" "FormatWrite"]}
      :mhinz/neovim-remote {}
      :KabbAmine/vCoolor.vim {}
      :mtdl9/vim-log-highlighting {}
      :aouelete/sway-vim-syntax {}
      "~/stuff/projects/cphelper/cphelper.nvim" {:rocks "http"
                                                 :requires "nvim-lua/plenary.nvim"}
      :axelf4/vim-strip-trailing-whitespace {}
      :tridactyl/vim-tridactyl {}
      :akinsho/nvim-toggleterm.lua {:config "require 'toggleterm'.setup()"
                                    :cmd "ToggleTerm"}
      :tjdevries/express_line.nvim {:config "require 'dotfiles.plugins.el'"}}})

(do
  (packer.init {:display {:prompt_border "rounded"}})
  (packer.reset)
  (each [group lst (pairs groups)]
    (each [plugin conf (pairs lst)]
      (let [p {1 plugin}]
        (packer.use (vim.tbl_deep_extend "error" p conf))))))
