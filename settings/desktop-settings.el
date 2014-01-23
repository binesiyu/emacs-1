;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-23 17:39:28 Thursday by yubin>

(eval-after-load "desktop"
  '(progn

     (setq desktop-load-locked-desktop t)
     (if is-before-emacs-21 (desktop-load-default) (desktop-save-mode 1))

     (dolist (var (list 'command-history 'kill-ring 'file-name-history 'find-symbol-last-symbol
                        'extended-command-history 'grep-history 'compile-history 'last-template
                        'minibuffer-history 'query-replace-history 'regexp-history
                        'shell-command-history 'recentf-open-last-file 'describe-symbol-last-symbol
                        'switch-major-mode-last-mode))
       (add-to-list 'desktop-globals-to-save var))

     (apply-define-key
      global-map
      `(("C-x M-C" desktop-clear)))))

(desktop-save-mode 1)

(provide 'desktop-settings)
