;;; init-path.el --- init lisp path

;; Copyright 2014 exsaber
;;
;; Author: yubinexsaber@gmail.com
;; Version: $Id: init-path.el,v 0.0 2014/01/15 10:15:03 yubin Exp $
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
;;   (require 'init-path)

;;; Code:

(defconst my-emacs-path "~/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "我下载的emacs lisp包的路径")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")
(defconst my-emacs-libs (concat my-emacs-path "libs/") "我的emacs库")
(defconst my-emacs-faces (concat my-emacs-path "faces/") "我的emacs库")

;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-libs "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)
(my-add-subdirs-to-load-path my-emacs-libs)
(my-add-subdirs-to-load-path my-emacs-faces)

(provide 'init-path)
;;; init-path.el ends here
