(require 'kas-utils)

(setq elixir-root "/opt/elixir")
(setq elixir-bin (concat elixir-root "/bin"))

(setq alchemist-mix-command (concat elixir-bin "/mix"))
(setq alchemist-iex-program-name (concat elixir-bin "/iex"))
(setq alchemist-execute-command (concat elixir-bin "/elixir"))
(setq alchemist-compile-command (concat elixir-bin "/elixirc"))

(add-hook 'elixir-mode-hook
          (lambda ()
            (company-mode)
            (alchemist-mode)
            (setq-default show-trailing-whitespace t)))

(add-hook 'elixir-mode-hook
          (lambda()
            (setq-local helm-dash-docsets '("Elixir"))))


(provide 'my_elixir)
