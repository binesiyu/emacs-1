;;; init-miscs-fun.el --- Some basic utility function of ahei
;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-09-11 09:53:02 Saturday by taoshanwen>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.


;;; Commentary:
;; 

;;; Code:

(when (>= 21 emacs-major-version)
  (defalias 'move-beginning-of-line 'beginning-of-line)
  (defalias 'move-end-of-line       'end-of-line))

;;;###autoload
(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.

HOOKS can be one list or just a hook."
  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))

;;;###autoload
(defun am-intern (&rest strings)
  "`intern' use STRINGS."
  (intern
   (apply
    'concat
    (mapcar
     (lambda (element)
       (if (stringp element) element (symbol-name element)))
     strings))))

;;;###autoload
(defun am-variable-is-t (symbol)
  "Return SYMBOL's value is t or not."
  (and (boundp symbol) (symbol-value symbol)))

;;;###autoload
(defmacro am-def-active-fun (symbol &optional fun-name)
  "Make definition of function judge variable is active or not."
  `(defun ,(if fun-name fun-name symbol) ()
     ,(concat "`" (symbol-name symbol) "' is t or not.")
     (am-variable-is-t ',symbol)))

;;;###autoload
(defun am-forward-word-or-to-word ()
  "`forward-word' or `forward-to-word'.
If after excute `forward-to-word', current position
is at next line, then rollback and excute `forward-word'"
  (interactive)
  (let ((noo (line-number-at-pos)) no)
    (save-excursion
      (forward-to-word 1)
      (setq no (line-number-at-pos)))
    (if (> no noo)
        (forward-word)
      (forward-to-word 1))))

;;;###autoload
(defmacro am-with-temp-mode (mode &rest body)
  "Create a temporary buffer with mode MODE, and evaluate BODY there like `progn'.
See also `with-temp-buffer'."
  `(with-temp-buffer
     (funcall ,mode)
     ,@body))

;;;###autoload
(defun am-equal-ignore-case (str1 str2)
  "STR1 equal ignore case to STR2 or not."
  (string= (downcase str1) (downcase str2)))

 
;;;###autoload
(defun execute-command-on-file (file command)
  "对FILE执行命令COMMAND"
  (interactive
   (list (read-file-name "File execute command on: ")
         (let* ((input ""))
           (while (string= input "")
             (setq input (read-string "命令: ")))
           input)))
  (if file
      (when (yes-or-no-p (concat command " file `" file "'?"))
        (shell-command (concat command " \"" file "\"")))
    (message "Executing command `%s'..." command)
    (shell-command command)))

;;;###autoload
(defun execute-command-on-current-file (command)
  "对当前buffer执行命令COMMAND, 如果该buffer对应文件的话, 再执行`revert-buffer-no-confirm'"
  (interactive
   (list (let* ((input ""))
           (while (string= input "")
             (setq input (read-string "命令: ")))
           input)))
  (let* ((file (buffer-file-name)))
    (execute-command-on-file file command)
    (if file
        (revert-buffer-no-confirm))))


;;;###autoload
(defmacro define-kbd     (keymap key def) `(define-key ,keymap (kbd ,key) ,def))
;;;###autoload
(defmacro local-set-kbd  (key command)    `(local-set-key (kbd ,key) ,command))
;;;###autoload
(defmacro global-set-kbd (key command)    `(global-set-key (kbd ,key) ,command))

;;;###autoload
(defalias 'apply-define-key 'eal-define-keys-commonly)
;;;###autoload
(defalias 'define-key-list 'eal-define-keys-commonly)

;;;###autoload
(defun apply-args-list-to-fun (fun-list args-list)
  "Apply args list to function FUN-LIST.
FUN-LIST can be a symbol, also can be a list whose element is a symbol."
  (let ((is-list (and (listp fun-list) (not (functionp fun-list)))))
    (dolist (args args-list)
      (if is-list
          (dolist (fun fun-list)
            (apply-args-to-fun fun args))
        (apply-args-to-fun fun-list args)))))

;;;###autoload
(defun apply-args-to-fun (fun args)
  "Apply args to function FUN."
  (if (listp args)
      (eval `(,fun ,@args))
    (eval `(,fun ,args))))

;;;###autoload
(defun kill-buffer-when-shell-command-exit ()
  "Close current buffer when `shell-command' exit."
  (let ((process (ignore-errors (get-buffer-process (current-buffer)))))
    (when process
      (set-process-sentinel process
                            (lambda (proc change)
                              (when (string-match "\\(finished\\|exited\\)" change)
                                (kill-buffer (process-buffer proc))))))))


;;;###autoload
(defun delete-current-window (&optional frame)
  "Delete window which showing current buffer."
  (interactive
   (list (and current-prefix-arg
              (or (natnump (prefix-numeric-value current-prefix-arg))
                  'visible))))
  (if (one-window-p)
      (bury-buffer)
    (delete-windows-on (current-buffer) frame)))

;;;###autoload
(defmacro def-turn-on (command &optional is-on)
  "Make definition of command whose name is COMMAND-on when IS-ON is t
and COMMAND-off when IS-ON is nil."
  (let ((on (if is-on "on" "off")))
    `(defun ,(am-intern command "-" on) ()
       ,(concat "Turn " on " `" command "'.")
       (interactive)
       (funcall ',(intern command) ,(if is-on 1 -1)))))

;;;###autoload
(defun unset-key (keymap key)
  "Remove binding of KEY in map KEYMAP.
KEY is a string or vector representing a sequence of keystrokes."
  (define-key keymap key nil))
  
(provide 'init-miscs-fun)

;;; ahei-misc.el ends here
