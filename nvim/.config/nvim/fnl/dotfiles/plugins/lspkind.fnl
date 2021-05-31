(module dotfiles.plugins.lspkind
        {require {icons nvim-nonicons
                  lspkind lspkind}})

(lspkind.init
   {:with_text true
    :symbol_map {:Class (icons.get :class)
                 :Color (icons.get :paintbrush)
                 :Constant (icons.get :constant)
                 :Constructor ""
                 :Enum (icons.get :list-unordered)
                 :EnumMember (icons.get :list-unordered)
                 :Event (icons.get :zap)
                 :Field (icons.get :field)
                 :File (icons.get :file)
                 :Folder (icons.get :file-directory-outline)
                 :Function "ƒ"
                 :Interface (icons.get :interface)
                 :Keyword (icons.get :typography)
                 :Method "ƒ"
                 :Module "{}"
                 :Operator (icons.get :diff)
                 :Property (icons.get :tools)
                 :Reference (icons.get :file-symlink-file)
                 :Snippet (icons.get :snippet)
                 :Struct (icons.get :struct)
                 :Text (icons.get :typography)
                 :TypeParameter (icons.get :type)
                 :Unit (icons.get :note)
                 :Value (icons.get :note)
                 :Variable (icons.get :variable)}})
