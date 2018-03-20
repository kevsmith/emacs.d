(require 'ox-odt)

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-FLIGHT(f)" "BLOCKED(b)" "|" "DONE(d)" "CANCELED(c)")))

(defun ks-default-weekday-deadline ()
  (setq day-name (format-time-string "%a"))
  (cond ((string= day-name "Fri") "+3d")
        ((string= day-name "Sat") "+2d")
        (t "+1d")))


(setq org-capture-templates
      '(("a" "TODO Format." entry
         (file "~/org/tasks/tasks/todo.org")
         "* TODO %?
SCHEDULED: %t
DEADLINE: %(org-insert-time-stamp (org-read-date nil t (ks-default-weekday-deadline)))")))

(setq org-enforce-todo-dependencies t)
(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))

(setq org-agenda-custom-commands
      '(("ac" tags "+aws+cost")))

(defun ks-pop-to-org-agenda (split)
  "Visit the org agenda in the current window or a split."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(defun ks-org-task-capture ()
  "Capture a task using my default org-mode template"
  (interactive)
  (org-capture nil "a"))

(defun backup-todos ()
  "Back up org-mode todos to GitHub"
  (when (eq major-mode 'org-mode)
    (message "Backing up %s to GitHub" (buffer-name))
    (shell-command-to-string "/Users/kevinsmith/bin/commit-agenda")))

(defun backup-journals ()
  "Back up org-journal files to GitHub"
  (when (eq major-mode 'org-journal-mode)
    (message "Backing up %s to GitHub" (buffer-name))
    (shell-command-to-string "/Users/kevinsmith/bin/commit-agenda")))

(add-hook 'after-save-hook #'backup-todos)
(add-hook 'after-save-hook #'backup-journals)

(require 'org-journal)

(defun ks-org-journal-mode-hook()
  ;; Enable visual-mode for nicer line wrapping
  (visual-line-mode))

(add-hook 'org-journal-mode-hook 'ks-org-journal-mode-hook)

(setq org-journal-dir "~/org/tasks/journal")
(setq org-journal-file-format "%Y%m%d.org")
(setq org-journal-date-format "%Y%m%d (%A)")

(setq org-agenda-files '("~/org/tasks/tasks"
                         "~/org/tasks/journal"))

(provide 'my_org_mode)
