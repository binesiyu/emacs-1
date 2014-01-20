;;; init-tools.el --- 

;; Copyright 2014 exsaber
;;
;; Author: yubinexsaber@gmail.com
;; Version: $Id: init-tools.el,v 0.0 2014/01/20 08:40:22 yubin Exp $
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
;;   (require 'init-tools)

;;; Code:

;; Emacs中的文本浏览器w3m
;; http://emacser.com/w3m.htm
(require 'w3m-settings)

;; erc: Emacs中的IRC
;; ERC使用简介 emacser.com/erc.htm
(require 'erc-settings)

;; 把pdf,ps,dvi文件转换为png格式, 在Emacs里面浏览
;;(if is-after-emacs-23
;;    (require 'doc-view)
;;  (setq doc-view-conversion-refresh-interval 3))

;; 在Emacs里面使用shell
(require 'term-settings)
(require 'multi-term-settings)

;; twitter client
(require 'eagle-settings)
(require 'twit-settings)

;; 用weblogger写WordPress博客
;; http://emacser.com/weblogger.htm
(require 'weblogger-settings)


(provide 'init-tools)
;;; init-tools.el ends here
