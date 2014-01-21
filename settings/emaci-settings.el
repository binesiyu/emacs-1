;; -*- Emacs-Lisp -*-
;; Time-stamp: <2013-12-21 17:38:58 Saturday by yubin>

(require 'init-utils)
(require 'emaci)

;;(apply-define-key
;; global-map
;; `(("M-s" emaci-mode-on)
;;   ("M-S" emaci-mode-off)))

(defun emaci-settings ()
  "settings for `emaci'."
  (setq emaci-brief-key-defs
        (append emaci-brief-key-defs
                `(("]" goto-paren))))
  (emaci-bind-brief-keys)
  
  ;;;###autoload
  (defun switch-major-mode-with-emaci ()
    "Run `switch-major-mode' with `emaci-mode'."
    (interactive)
    (let ((emaci emaci-mode))
      (call-interactively 'switch-major-mode)
      (emaci-mode (if emaci 1 -1))))

  ;;;###autoload
  (defun toggole-emaci-mode ()
    "toggole-emaci-status"
    (interactive)
    (if emaci-mode
        (emaci-mode-off)
      (emaci-mode-on)))
  )

(eval-after-load "emaci"
  `(emaci-settings))

(provide 'emaci-settings)
