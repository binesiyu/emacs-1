;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-26 10:22:22 Monday by ahei>

(require 'yasnippet)

(yas/global-mode 1)

(defun yasnippet-settings ()
  "settings for `yasnippet'."
  
;;;###autoload
  (defun yasnippet-reload-after-save ()
    (let* ((bfn (expand-file-name (buffer-file-name)))
           (root (expand-file-name yas-snippet-dirs)))
      (when (string-match (concat "^" root) bfn)
        (yas-load-snippet-buffer))))
  ;(add-hook 'after-save-hook 'yasnippet-reload-after-save)
  )

(eval-after-load "yasnippet"
  `(yasnippet-settings))

(provide 'yasnippet-settings)
