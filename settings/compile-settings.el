;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-21 12:59:10 Tuesday by yubin>

;; 智能编译
(require 'my-smart-compile)

(defalias 'cpl 'compile)

(require 'compile-misc)

(defun compile-settings ()
  "Settings for `compile'."
  ;; 设置编译命令
  (setq compile-command "make -k")

  (eal-define-keys
   makefile-mode-map-list
   `(("M-p"	  previous-error)
     ("M-n"	  next-error)
     ("C-c p" makefile-previous-dependency)
     ("C-c n" makefile-next-dependency)))

  (setq compilation-scroll-output t))

(eal-define-keys
 'compilation-mode-map
 `(("n" compilation-next-error)
   ("p" compilation-previous-error)
   ("'" switch-to-other-buffer)
   ("u" View-scroll-half-page-backward)
   ("f" am-forward-word-or-to-word)
   ("d" scroll-up)
   ("v" set-mark-command)
   ("w" scroll-down)))

(eval-after-load "compile"
  '(compile-settings))

(provide 'compile-settings)
