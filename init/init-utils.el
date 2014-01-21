;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-21 11:18:42 Tuesday by yubin>

(require 'eval-after-load)

(defvar mswin  (equal window-system 'w32)  "Non-nil means windows system.")
(defvar cygwin (equal system-type 'cygwin) "Non-nil means cygwin system.")

(defconst system-head-file-dir (list "/usr/include" "/usr/local/include" "/usr/include/sys") "系统头文件目录")
(defconst user-head-file-dir   (list "." "../hdr" "../include") "用户头文件目录")

(defconst is-before-emacs-21 (<= emacs-major-version 21) "是否是emacs 21或以前的版本")
(defconst is-after-emacs-23  (>= emacs-major-version 23) "是否是emacs 23或以后的版本")
(defconst is-after-emacs-24  (>= emacs-major-version 24) "是否是emacs 24或以后的版本")

(defvar c-modes '(c-mode c++-mode awk-mode java-mode) "*C modes.")
(defvar dev-modes (append c-modes '(python-mode perl-mode makefile-gmake-mode)) "*Modes for develop.")

(defvar makefile-mode-map-list nil "the list of `makefile-mode-map'")
(if is-before-emacs-21
    (setq makefile-mode-map-list '(makefile-mode-map))
  (setq makefile-mode-map-list '(makefile-gmake-mode-map makefile-automake-mode-map)))

(provide 'init-utils)
