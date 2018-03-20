(require 'package)
(add-to-list 'package-archives '("melpa". "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(defvar my-pkgs '(alchemist
                  autopair
		  color-theme
                  color-theme-solarized
                  company
                  company-erlang
                  dracula-theme
                  erlang
                  flymd
                  flymake-go
                  go-mode
                  helm
                  helm-dash
                  immortal-scratch
                  magit
                  markdown-mode
                  markdown-mode+
                  multi-term
                  org-mind-map
                  org-journal
                  pbcopy
                  no-littering
                  terraform-mode
                  tuareg
                  turnip
                  vlf
                  yasnippet))

(dolist (p my-pkgs)
  (when (not (package-installed-p p))
    (package-install p)))

(defvar my-docsets '("Go"
                     "Erlang"
                     "Elixir"))

;;(dolist (d my-docsets)
;; (helm-dash-async-install-docset d))

(provide 'my_packages)
