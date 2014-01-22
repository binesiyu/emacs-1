;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-04-07 21:26:27 Saturday by taoshanwen>



(apply-args-list-to-fun
 'def-command-max-window
 `("info"))

(add-hook 'info-mode-hook 'turn-on-iimage-mode)

(defun info-settings ()
  "settings for `info'."
  (require 'info+))

(eval-after-load "info"
  `(info-settings))

(provide 'info-settings)
