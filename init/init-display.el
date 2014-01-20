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



(provide 'init-display)
;;; init-display.el ends here
