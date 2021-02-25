(module dotfiles.module.compe
  {require {nvim aniseed.nvim
            compe compe}})

(compe.setup
  {:enabled true
   :autocomplete true
   :adebug false
   :amin_length 1
   :apreselect "enable"
   :athrottle_time 80
   :asource_timeout 200
   :aincomplete_delay 400
   :amax_abbr_width 100
   :amax_kind_width 100
   :amax_menu_width 100
   :adocumentation true
   :source {:path true
            :tabnine true
            :buffer true
            :calc true
            :vsnip true
            :nvim_lsp true
            :nvim_lua true
            :spell true
            :tags true
            :treesitter true
            :conjure true
            :zsh true}})
