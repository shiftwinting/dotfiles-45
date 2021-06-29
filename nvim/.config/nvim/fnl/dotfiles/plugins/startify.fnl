(module dotfiles.plugins.startify
  {require {nvim aniseed.nvim}})

(defn gitModified []
  (let [files (vim.fn.systemlist "git ls-files -m 2>/dev/null")]
    (vim.fn.map files "{'line': v:val, 'path': v:val}")))

(defn gitUntracked []
  (let [files (vim.fn.systemlist "git ls-files -o --exclude-standard 2>/dev/null")]
    (vim.fn.map files "{'line': v:val, 'path': v:val}")))
