(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
(require 'tuareg)

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
      (when (and opam-share (file-directory-p opam-share))
       ;; Register Merlin
       (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
       (autoload 'merlin-mode "merlin" nil t nil)
       ;; Automatically start it in OCaml buffers
       (add-hook 'tuareg-mode-hook 'merlin-mode t)
       (add-hook 'caml-mode-hook 'merlin-mode t)
       ;; Use opam switch to lookup ocamlmerlin binary
       (setq merlin-command 'opam)))

(defun my-ocaml-hook()
  (setq show-trailing-whitespace t)
  (setq indicate-empty-lines t)
  (prettify-symbols-mode))

(add-hook 'tuareg-mode-hook 'my-ocaml-hook)


(define-key tuareg-mode-map [(f12)] 'next-error)
(define-key tuareg-mode-map [(shift f12)] 'previous-error)

(autoload 'utop "utop" "Toplevel for OCaml" t)

(provide 'my_ocaml)
