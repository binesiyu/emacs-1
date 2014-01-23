;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-23 13:31:04 Thursday by yubin>

(add-hook 'write-file-functions 'time-stamp)

(eval-after-load "time-stamp"
  '(progn
     (setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S %:a by %u")))

(provide 'time-stamp-settings)
