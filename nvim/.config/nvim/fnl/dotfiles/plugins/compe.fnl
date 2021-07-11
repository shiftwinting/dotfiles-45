(module dotfiles.plugins.compe
  {require {nvim aniseed.nvim
            compe compe}})

(compe.setup
  {:enabled true
   :autocomplete true
   :debug false
   :min_length 1
   :preselect "enable"
   :throttle_time 80
   :source_timeout 200
   :incomplete_delay 400
   :max_abbr_width 100
   :max_kind_width 100
   :max_menu_width 100
   :documentation {:winhighlight "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
                   :border "single"}
   :source {:path true
            :buffer true
            :calc true
            :snippets_nvim true
            :nvim_lsp true
            :nvim_lua false
            :spell false
            :tags true
            :treesitter true
            :conjure true
            :orgmode true
            :zsh true}})
