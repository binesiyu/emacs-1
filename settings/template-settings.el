;; -*- Emacs-Lisp -*-

;; Time-stamp: <2011-06-29 19:22:36 Wednesday by taoshanwen>

(require 'template)

(defun template-settings ()
  "settings for `template'."
  (setq template-default-directories (list (concat my-emacs-path "/templates/")))

  (defvar last-template nil "最近使用的模版文件")

  (defun my-template-expand-template (template)
    "展开template的模版文件"
    (interactive
     (list
      (read-file-name
       (if last-template (format "请指定模版文件(缺省为%s): " last-template) "请指定模版文件: ")
       (concat my-emacs-path "templates") last-template t)))
    (template-expand-template template)
    (setq last-template template)))

(eval-after-load "template"
  `(template-settings))

(template-initialize)

(provide 'template-settings)
