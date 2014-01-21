;;; init-files.el --- 

;; Copyright 2014 exsaber
;;
;; Author: yubinexsaber@gmail.com
;; Version: $Id: init-files.el,v 0.0 2014/01/20 08:25:02 yubin Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-files)

;;; Code:


;; ffap,打开当前point的文件
(require 'init-settings-ffap)

;; time-stamp, 在文件头记录修改时间, 并动态更新
(require 'time-stamp-settings)

(defun visit-.emacs ()
  "访问.emacs文件"
  (interactive)
  (find-file (concat my-emacs-path ".emacs")))
(global-set-key (kbd "C-x E") 'visit-.emacs)

;; grep
(require 'grep-settings)

;; ack-grep, grep纯perl的代替品
(require 'full-ack-settings)

(defun copy-file-name (&optional full)
  "Copy file name of current-buffer.
If FULL is t, copy full file name."
  (interactive "P")
  (let ((file (buffer-name)))
    (if full
        (setq file (expand-file-name file)))
    (kill-new file)
    (message "File `%s' copied." file)))
(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map sh-mode-map
                       c-mode-base-map text-mode-map ruby-mode-map html-mode-map
                       java-mode-map conf-javaprop-mode-map conf-space-mode-map
                       python-mode-map py-mode-map cperl-mode-map)
 `(("C-c M-C" copy-file-name)))

(defun goto-my-emacs-lisps-dir ()
  "Goto `my-emacs-lisps-path'."
  (interactive)
  (dired my-emacs-lisps-path))
(defun goto-my-emacs-my-lisps-dir ()
  "Goto `my-emacs-my-lisps-path'."
  (interactive)
  (dired my-emacs-my-lisps-path))
(defun goto-my-emacs-dir ()
  "Goto `my-emacs-path'."
  (interactive)
  (dired my-emacs-path))
(defun goto-my-home-dir ()
  "Goto my home directory."
  (interactive)
  (dired "~"))
 
 (defun dos2unix ()
  "dos2unix on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'unix))

(defun unix2dos ()
  "unix2dos on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'dos))

;;;###autoload
(defun execute-command-on-current-dir (command)
  "对当前目录执行命令COMMAND."
  (interactive
   (list (let* ((input ""))
           (while (string= input "")
             (setq input (read-string "命令: ")))
           input)))
  (let* ((file (buffer-file-name)))
    (execute-command-on-file default-directory command)
    (if file
        (revert-buffer-no-confirm))))

;;;###autoload
(defmacro def-execute-command-on-file-command (command)
  "Make definition of command which execute command on file."
  `(defun ,(intern (subst-char-in-string ?\ ?- command)) (file)
     ,(concat "Run command `" command "' on file FILE.")
     (interactive (list (read-file-name (concat "File to " ,command ": "))))
     (execute-command-on-file file ,command)))

;;;###autoload
(defmacro def-execute-command-on-current-file-command (command)
  "Make definition of command which execute command on current file."
  `(defun ,(am-intern (subst-char-in-string ?\ ?- command) "-current-file") ()
     ,(concat "Execute command `" command "' on current file.")
     (interactive)
     (execute-command-on-current-file ,command)))

;;;###autoload
(defmacro def-execute-command-on-current-dir-command (command)
  "Make definition of command which execute command on current directory."
  `(defun ,(am-intern (subst-char-in-string ?\ ?- command) "-current-dir") ()
     ,(concat "Execute command `" command "' on current directory.")
     (interactive)
     (execute-command-on-current-dir ,command)))
 
(provide 'init-files)
;;; init-files.el ends here
