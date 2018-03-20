(defvar slack-pkgs '(websocket
                     request
                     oauth2
                     circe
                     alert
                     emojify
                     slack))

(dolist (p slack-pkgs)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'slack)

(setq slack-buffer-emojify t)
(setq slack-prefer-current-team t)

(slack-register-team
 :name "Adroll"
 :client-id ""
 :client-secret ""
 :token ""
 :subscribed-channels '()

(provide 'my_slack)
