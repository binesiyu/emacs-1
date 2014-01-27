;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-27 15:55:14 Monday by yubin>

;; cedet1.0pre6 is conflict with which-func
;; after require cedet, which-func cann't work

;; http://emacser.com/install-cedet.htm
;; http://emacser.com/cedet.htm

(require 'cedet)
(require 'semantic/sb)

;; Semantic
(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)

(global-ede-mode 1)
(semantic-mode 1)

(provide 'cedet-settings)
