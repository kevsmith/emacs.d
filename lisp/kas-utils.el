(defun kas-make-doc-hook(docsets)
  (lambda()
    (interactive)
    (setq-local helm-dash-docsets docsets)))

(provide 'kas-utils)
