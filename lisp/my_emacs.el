(load-theme 'dracula t)

(require 'vlf-setup)

(immortal-scratch-mode)

(set-face-attribute 'minibuffer-prompt nil :foreground "#fcfcfc")

(global-linum-mode)
(global-visual-line-mode)
(setq column-number-mode t)

(setq vlf-application 'dont-ask)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(defun darwin-customizations()
  ;; Workaround for OSX's stupid env var behavior
  (setenv "PATH"
          (concat
           "/bin" ":"
           "/usr/bin" ":"
           "/usr/local/bin" ":"
           (concat (getenv "HOME") "/bin") ":"
           "/opt/erl/bin" ":"
           "/opt/elixir/bin" ":"
           "/opt/golang/bin" ":"))
    (if window-system
      (set-exec-path-from-shell-PATH)))
  ;; Enable OSX clipboard integration
  (require 'pbcopy)
  (turn-on-pbcopy)
  (turn-off-auto-fill)

(when (eq system-type 'darwin)
  (darwin-customizations))

; Ensure emacs-server is running
(require 'server)
(unless (server-running-p)
  (server-start))

;; Faster that default scp
(setq tramp-default-method "ssh")

;; Fix weird whitespace cleanup behavior w/Makefiles
(defun fix-tabs-in-makefiles-hook()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'fix-tabs-in-makefiles-hook)

(defadvice whitespace-cleanup (around whitespace-cleanup-indent-tab
                                       activate)
   "Fix whitespace-cleanup indent-tabs-mode bug"
   (let ((whitespace-indent-tabs-mode indent-tabs-mode)
         (whitespace-tab-width tab-width))
     ad-do-it))

;; turn off annoying autosave & backup files
(setq confirm-nonexistent-file-or-buffer nil)
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

;; Allow 'y' or 'n' for yes/no prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Seed the random-number generator
(random t)

;; Nuke whitespace when writing a file
;;(add-hook 'after-save-hook 'whitespace-cleanup)

;; Set up multi-term
(setq multi-term-program "/usr/local/bin/zsh")
(require 'multi-term)

(require 'helm-config)
(helm-mode)
(setq helm-exit-idle-delay 0)
(setq helm-dash-browser-func 'eww)

(defun ks-nuke-all-buffers ()
  "Kill all buffers except for *scratch* and terminal sessions"
  (interactive)
  (mapcar
   (lambda (b)
     (let ((name (buffer-name b)))
       (unless (or (string= name "*scratch*")
                   (string-prefix-p "*terminal" name))
         (kill-buffer b))))
   (buffer-list))
  (delete-other-windows))

(provide 'my_emacs)
