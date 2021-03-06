;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-26 11:13:31 Sunday by yubin>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

;; hippie expand
(require 'hippie-expand-settings)


;; (require 'company-settings)

;; 自动插入一些文件模板,用template
(require 'template-settings)

;; 自动插入一些文件模板
;; (require 'auto-insert-settings)

;; 超强的snippet
(require 'yasnippet-settings)

;; 自动补全
(require 'auto-complete-settings)


;; 用M-x执行某个命令的时候，在输入的同时给出可选的命令名提示
(require 'icomplete-settings)

(require 'completion-list-mode-settings)
 
 ;; 简写模式
;(setq-default abbrev-mode t)
;(setq save-abbrevs nil)

(provide 'all-auto-complete-settings)
