(let [{: cmd : g} vim
      {: stdpath : empty : glob} vim.fn
      {: format} string]
  (tset g "aniseed#env" {:module "dotfiles.init"
                         :compile true})

  (fn ensure [user repo]
    "Ensures that a specified module is downloaded and then loaded"
    (local path (format "%s/site/pack/packer/start/%s" (stdpath :data) repo))
    (when (> (empty (glob path)) 0)
      (cmd (format "!git clone https://github.com/%s/%s %s" user repo path))
      (cmd (format "packadd %s" repo))))

  (ensure :wbthomason "packer.nvim")
  (ensure :Olical "aniseed"))

(let [packer (require :packer)
      packages (require :packages)]
  (packer.startup (fn [use]
                    (each [_ value (pairs packages)]
                      (use value)))))
true
