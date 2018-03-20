(require 'kas-utils)
(setq gofmt-command "goimports")
(setq go-path-root "/Users/kevinsmith/repos/work/go")
(setenv "GOPATH" go-path-root)
(add-to-list 'exec-path (concat go-path-root "/bin"))

(add-hook 'go-mode-hook
          (lambda()
            (setq tab-width 4)
            (add-hook 'before-save-hook 'gofmt-before-save nil 'local-hook)
            (add-hook 'flycheck-mode-hook 'flycheck-gometalinter-setup nil 'local-hook)
            (set (make-local-variable 'company-backends) '(company-go))
            (company-mode)
            (flycheck-mode)
            (go-eldoc-setup)
            (setq flycheck-gometalinter-vendor t)
            (setq flycheck-gometalinter-test t)
            (setq flycheck-gometalinter-fast t)
            (setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
            (setq flycheck-gometalinter-deadline "10s")))

(add-hook 'go-mode-hook
          (lambda()
            (setq-local helm-dash-docsets '("Go"))))

(provide 'my_go)
