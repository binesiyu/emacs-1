;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-01-01 14:34:22 Sunday by taoshanwen>



(defun help-mode-settings ()
  "settings of `help-mode'."

  (defun goto-help-buffer ()
    "Goto *Help* buffer."
    (interactive)
    (let ((buffer (get-buffer "*Help*")))
      (if buffer
          (switch-to-buffer buffer)
        (message "*Help* buffer dose not exist!"))))

  (def-turn-on "view-mode" nil)
  (am-add-hooks 'help-mode-hook 'view-mode-off))

(eval-after-load "help-mode"
  `(help-mode-settings))

(provide 'help-mode-settings)
