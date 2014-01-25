;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-25 15:54:20 Saturday by yubin>
(unless (eq window-system 'w32)
 (when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 17)
    ;; (huangq-fontset-dejavu 17)))
    ;; (huangq-fontset-fixedsys 17)
    (set-default-font "Monospace 11"))))

(when (eq window-system 'w32)
   (set-face-attribute
  'default nil :font "Consolas 12")

;; Chinese Font
   (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 16))))



(provide 'font-settings)
