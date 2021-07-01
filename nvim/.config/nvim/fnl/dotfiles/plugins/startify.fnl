(module dotfiles.plugins.startify
  {require {nvim aniseed.nvim}})

(set nvim.g.startify_lists
  [{:type "sessions" :header ["   Sessions"]}
   {:type "bookmarks" :header ["   Bookmarks"]}
   {:type (fn [] (let [files (vim.fn.systemlist "git ls-files -m 2>/dev/null")]
                   (vim.fn.map files "{'line': v:val, 'path': v:val}")))
    :header ["   git modified"]}
   {:type (fn [] (let [files (vim.fn.systemlist "git ls-files -o --exclude-standard 2>/dev/null")]
                   (vim.fn.map files "{'line': v:val, 'path': v:val}")))
    :header ["   git untracked"]}
   {:type "commands" :header ["   Commands"]}
   {:type "files" :header ["   MRU"]}
   {:type "dir" :header [(.. "   MRU " (vim.fn.getcwd))]}])
(set nvim.g.startify_files_number 5)
(def v (vim.version))
(set nvim.g.startify_custom_header
  (vim.fn.startify#pad
    (vim.list_extend
      [(.. "NVIM " v.major "." v.minor "." v.patch)]
      (vim.fn.startify#fortune#quote))))
