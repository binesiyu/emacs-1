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

;; Emacs�е��ı������w3m
;; http://emacser.com/w3m.htm
(require 'w3m-settings)

;; erc: Emacs�е�IRC
;; ERCʹ�ü�� emacser.com/erc.htm
(require 'erc-settings)

;; ��pdf,ps,dvi�ļ�ת��Ϊpng��ʽ, ��Emacs�������
;;(if is-after-emacs-23
;;    (require 'doc-view)
;;  (setq doc-view-conversion-refresh-interval 3))

;; ��Emacs����ʹ��shell
(require 'term-settings)
(require 'multi-term-settings)

;; twitter client
(require 'eagle-settings)
(require 'twit-settings)

;; ��webloggerдWordPress����
;; http://emacser.com/weblogger.htm
(require 'weblogger-settings)


(provide 'init-tools)
;;; init-tools.el ends here
