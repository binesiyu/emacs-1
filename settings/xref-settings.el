;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 18:25:31 Saturday by ahei>

(require 'xrefactory)

(defun xref-settings ()
  "settings for `xref'."
  (defvar xref-current-project nil)
  (defvar xref-key-binding 'global)
  (setq exec-path (cons (concat my-emacs-lisps-path "xref") exec-path)))

(eval-after-load "xref"
  `(xref-settings))

(provide 'xref-settings)
