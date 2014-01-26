;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-26 13:39:40 Sunday by yubin>

(eval-after-load "desktop"
  '(progn

     (defadvice desktop-read (around trace-desktop-errors activate)
       (let ((debug-on-error t))
         ad-do-it))

     (defadvice desktop-read (around time-restore activate)
       (let ((start-time (current-time)))
         (prog1
             ad-do-it
           (message "Desktop restored in %.2fms"
                    (exsaber/time-subtract-millis (current-time)
                                                  start-time)))))

     (defadvice desktop-create-buffer (around time-create activate)
       (let ((start-time (current-time))
             (filename (ad-get-arg 1)))
         (prog1
             ad-do-it
           (message "Desktop: %.2fms to restore %s"
                    (exsaber/time-subtract-millis (current-time)
                                                  start-time)
                    (when filename
                      (abbreviate-file-name filename))))))

     (setq desktop-load-locked-desktop t)

     (dolist (var (list 'command-history 'kill-ring 'file-name-history 'find-symbol-last-symbol
                        'extended-command-history 'grep-history 'compile-history 'last-template
                        'minibuffer-history 'query-replace-history 'regexp-history
                        'shell-command-history 'recentf-open-last-file 'describe-symbol-last-symbol
                        'switch-major-mode-last-mode))
       (add-to-list 'desktop-globals-to-save var))

     (apply-define-key
      global-map
      `(("C-x M-C" desktop-clear)))))

(setq desktop-path (list user-emacs-directory))

(desktop-save-mode 1)

(provide 'desktop-settings)
