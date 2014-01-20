;; -*- Emacs-Lisp -*-
;; Time-stamp: <2013-12-21 17:38:58 Saturday by yubin>

(require 'init-utils)
(require 'emaci)

;;(apply-define-key
;; global-map
;; `(("M-s" emaci-mode-on)
;;   ("M-S" emaci-mode-off)))

(eal-define-keys
 'emaci-mode-map
 `(("/" describe-symbol-at-point)
   ("'" switch-to-other-buffer)
   ("L" count-brf-lines)
   ("t" sb-toggle-keep-buffer)
   ("]" goto-paren)
   ("c" go-to-char-forward-sb)
   ("C" go-to-char-backward-sb)))

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
  
  (eal-define-keys-commonly
   global-map
   `(("C-x q" toggole-emaci-mode))))

(eval-after-load "emaci"
  `(emaci-settings))

(provide 'emaci-settings)
