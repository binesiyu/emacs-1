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

;; color theme Emacs����
(require 'color-theme-settings)

(require 'ahei-face)
(require 'color-theme-ahei)
(require 'face-settings)

;; ��������
(require 'font-settings)

;; ���Ӹ��ḻ�ĸ���
(require 'generic-x)

;; ���԰ѹ���ɷ�����һ��С����
(require 'bar-cursor)
;;���ܵĸı�����״
(require 'cursor-change)
(cursor-change-mode 1)

;; ����Emacs��ʱ�����Emacs
(require 'maxframe-settings)



(provide 'init-display)
;;; init-display.el ends here
