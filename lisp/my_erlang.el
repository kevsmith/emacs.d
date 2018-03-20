(setq erlang-root-dir "/opt/erlang")
(setq exec-path (cons "/opt/erlang/bin" exec-path))

(require 'kas-utils)
(require 'erlang-flymake)
(require 'distel)
(distel-setup)

;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-name" "emacs@127.0.0.1"))
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol "emacs@127.0.0.1"))

(defun my-erlang-mode-hook()
  ;; Turn off annoying flymake dialog by
  ;; overriding flymake-display-warning
  (defun flymake-display-warning (warning)
    "Display a warning to the user in the mini-buffer"
    (message warning))
  (setq erlang-indent-level 4))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
(add-hook 'erlang-mode-hook (kas-make-doc-hook '("Erlang")))

(provide 'my_erlang)
