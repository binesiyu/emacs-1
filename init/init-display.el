;;; init-display.el --- 

;; Copyright 2014 exsaber
;;
;; Author: yubinexsaber@gmail.com
;; Version: $Id: init-display.el,v 0.0 2014/01/20 08:26:30 yubin Exp $
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
;;   (require 'init-display)

;;; Code:

;; color theme Emacs主题
(require 'color-theme-settings)

(require 'ahei-face)
(require 'color-theme-ahei)
(require 'face-settings)

;; 字体配置
(require 'font-settings)

;; 增加更丰富的高亮
(require 'generic-x)

;; 可以把光标由方块变成一个小长条
(require 'bar-cursor)
;;智能的改变光标形状
(require 'cursor-change)
(cursor-change-mode 1)

;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

;; `mode-line'显示格式
(require 'init-settings-mode-line)

;;;###autoload
(defun list-colors-display-htm (&optional list)
  "Create HTML page which lists all the defined colors."
  (interactive)
  (if (and (null list) window-system)
      (progn
        (setq list (x-defined-colors))
        ;; Delete duplicate colors.
        (let ((l list))
          (while (cdr l)
            (if (facemenu-color-equal (car l) (car (cdr l)))
                (setcdr l (cdr (cdr l)))
              (setq l (cdr l)))))))
  (with-output-to-temp-buffer "*Colors*"
    (save-excursion
      (set-buffer standard-output)
      (insert "<html>\n"
              "<head>\n"
              "<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n"
              "<title>Colors</title>\n"
              "</head>\n"
              "<body>\n"
              "<h1>Colors</h1>\n"
              "<p>\n"
              "<pre>\n")
      (let (s)
        (while list
          (insert (format (concat "<span style=\"background-color:%s\">%-20s</span>"
                                  "  "
                                  "<span style=\"color:%s\">%s</span>"
                                  "\n")
                          (html-color (car list)) (car list)
                          (html-color (car list)) (car list)))
          (setq list (cdr list))))
      (insert "</pre>"
              "</body>"
              "</html>"))))

;;;###autoload
(defun html-color (string)
  "Convert colors names to rgb(n1,n2,n3) strings."
  (format "rgb(%d,%d,%d)"
          (/ (nth 0 (x-color-values string)) 256)
          (/ (nth 1 (x-color-values string)) 256)
          (/ (nth 2 (x-color-values string)) 256)))

;;;###autoload
(defmacro def-command-max-window (command)
  "Make definition of command which after execute command COMMAND execute `delete-other-windows'."
  `(defun ,(am-intern command "-max-window") ()
     ,(concat "After run command `" command "' execute command `delete-other-windows'.")
     (interactive)
     (call-interactively ',(intern command))
     (delete-other-windows)))
 
(provide 'init-display)
;;; init-display.el ends here
