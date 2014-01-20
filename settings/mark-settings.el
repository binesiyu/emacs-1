;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 19:54:07 Saturday by ahei>

(require 'init-utils)

(transient-mark-mode 1)

(defun mark-command (&optional no-record)
  "如果是CUA mode, 则执行`cua-set-mark', 否则执行`set-mark-command'.
if NO-RECORD is non-nil, do not record last-region."
  (interactive)
  (unless no-record
    (setq last-region-beg (point))
    (setq last-region-is-rect nil))
  (let ((command (if cua-mode 'cua-set-mark 'set-mark-command)))
    (if (interactive-p)
        (call-interactively command)
      (funcall command))))

(defmacro def-mark-move-command (command)
  "Make definition of command which first `mark-command' and then move."
  `(defun ,(am-intern "mark-and-" command) ()
     ,(concat "If no `mark-active', then `mark-command'. After do
that, execute `" command "'.")
     (interactive)
     (if (not mark-active) (call-interactively 'mark-command))
     (call-interactively (intern ,command))
     (setq last-region-end (point))))

(apply-args-list-to-fun
 'def-mark-move-command
 `("next-line" "previous-line" "end-of-buffer" "beginning-of-buffer"))

(defmacro def-remember-command (command)
  "Make definition of command which remember `poiint'."
  `(defun ,(am-intern command "-remember") ()
     ,(concat "When `" command "' remember `point'.")
     (interactive)
     (call-interactively (intern ,command))
     (if mark-active
         (setq last-region-end (point)))))

(apply-args-list-to-fun
 'def-remember-command
 `("previous-line" "next-line"
   "am-forward-word-or-to-word" "forward-word" "backward-word"
   "forward-char" "backward-char"))

(define-key-list
 global-map
 `(("C-n"     next-line-remember)
   ("C-p"     previous-line-remember)
   ("C-f"     forward-char-remember)
   ("C-b"     backward-char-remember)
   ("M-f"     am-forward-word-or-to-word-remember)
   ("M-b"     backward-word-remember)
   ("M-F"     forward-word-remember)
   ("C-x C-n" mark-and-next-line)
   ("C-x C-p" mark-and-previous-line)
   ("C-x M->" mark-and-end-of-buffer)
   ("C-x M-<" mark-and-beginning-of-buffer)))

(if window-system
    (define-key global-map (kbd "C-2") 'set-mark-command))

(provide 'mark-settings)
