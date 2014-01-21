;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-04-17 18:33:59 Tuesday by taoshanwen>

(defun man-settings ()
  "settings for `man'."

   ;;;###autoload
  (defun man-current-word ()
    "查看当前光标所在的词的`man'"
    (interactive)
    (manual-entry (current-word)))

  (setq Man-notify-method 'pushy))

(eval-after-load "man"
  '(man-settings))

(require 'woman-settings)

(provide 'man-settings)
