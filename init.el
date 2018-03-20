;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/better-defaults")
(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(add-to-list 'load-path "~/.emacs.d/lisp")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/private/etc/ssl/cert.pem" "/etc/ssl/cert.pem"))))

(require 'my_packages)
(require 'no-littering)
(require 'better-defaults)
(require 'my_defaults)
(require 'my_emacs)
(require 'my_erlang)
(require 'my_elixir)
(require 'my_go)
(require 'my_snippets)
(require 'fira_code)
(require 'my_sqli)
(require 'my_terminal)
(require 'my_org_mode)

(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<up>") 'enlarge-window)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "C-z") 'multi-term)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l")'org-store-link)
(global-set-key (kbd "C-c b") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c d") 'helm-dash-at-point)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c t a") 'ks-pop-to-org-agenda)
(global-set-key (kbd "<f5>") 'ks-org-task-capture)
(global-set-key (kbd "<f6>") 'org-journal-new-entry)
(global-set-key (kbd "<f2>") 'ks-nuke-all-buffers)
