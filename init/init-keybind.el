;;; init-keybind.el --- 

;; Copyright 2014 exsaber
;;
;; Author: yubinexsaber@gmail.com
;; Version: $Id: init-keybind.el,v 0.0 2014/01/21 08:20:43 yubin Exp $
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
;;   (require 'init-keybind)

;;; Code:

;================global-map=================

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x s") 'switch-to-scratch)

(global-set-key (kbd "C-x D") 'ediff)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; 重新定义`help-command',因为C-h已经绑定为删除前面的字符
(global-set-key (kbd "C-x /") 'help-command)

;; 查找定义
(global-set-key (kbd "C-c x d") 'xref-push-and-goto-definition)
;; 返回
(global-set-key (kbd "C-c x r") 'xref-pop-and-return)
;; 浏览符号
(global-set-key (kbd "C-c x b") 'xref-browse-symbol)
;; 上一个引用
(global-set-key (kbd "C-c x ,") 'xref-previous-reference)
;; 下一个引用
(global-set-key (kbd "C-c x .") 'xref-next-reference)

(global-set-key (kbd "C-x m") 'get-mode-name)
(global-set-key (kbd "C-x q") 'switch-major-mode)

(global-set-key (kbd "C-x E") 'visit-.emacs)
;;org
(define-prefix-command 'm-spc-map)
(global-set-key (kbd "M-SPC") 'm-spc-map)

(eal-define-keys-commonly
 global-map
 `(
   ("C-c l" org-store-link)
   ("C-c c" org-capture)
   ("C-c a" org-agenda)
   ("C-c b" org-iswitchb)
   ("C-x M-E" toggle-debug-on-error)
   ("C-x Q"   toggle-debug-on-quit)
   ;;goto
   ("C-x G l" goto-my-emacs-lisps-dir)
   ("C-x G m" goto-my-emacs-my-lisps-dir)
   ("C-x G e" goto-my-emacs-dir)
   ("C-x M-H" goto-my-home-dir)
    
   ("C-x M-c" describe-char)
   ("C-x M-C" set-buffer-file-coding-system)
   
   ("C-x M-D" dos2unix)
   
   ("M-r"     query-replace)
   ("M-%"     query-replace)
   ("ESC M-%" query-replace-regexp)
   ("ESC M-r" query-replace-regexp)
   ("C-x M-r" query-replace-regexp)
   ("M-z"     zap-to-char)
   ("C-j"     goto-line)
   ("C-x C-s" save-buffer)
   
   ("C-x M-k" Info-goto-emacs-key-command-node)
   ("C-x ESC ESC" repeat-complex-command)
    
   ("C-x M-O" open-current-file-with-app)
    
   ;;align-setting     
   ("C-x a"   align)
   ("C-x M-a" align-regexp)
   
   ;;buffer
   ("C-x M-n" next-buffer)
   ("C-x M-p" previous-buffer)
   ;;revert
   ("C-x u"   revert-buffer-no-confirm)
   ("C-x M-K" revert-buffer-with-gbk)
   ("C-x U"   revert-buffer-with-coding-system-no-confirm)
   
   ("C-x l" count-brf-lines)
   ("C-x L" (lambda () (interactive) (count-brf-lines t)))
   
    ;;paren-setting
   ("C-M-]" ywb-indent-accoding-to-paren)
   ("\C-]" goto-paren)
   
   ;;describe-find-symbol-setting 
   ("C-x C-k" describe-key)
   ("C-x C-m" describe-mode)
   ("C-x / A" describe-face)
   ("C-x / a" apropos)
   ("C-x A"   apropos-command)
   ("C-x C-d" find-symbol)
   ("C-x K"   find-symbol-fun-on-key)
   (,(if window-system "C-x C-/" "C-x C-_") describe-symbol)
   ;;dired-setting 
   ("C-x d" dired-jump)
   ;;edit
   ("M-k" kill-whole-paragraph)
   ("M-C-k" kill-paragraph)
   ("M-C" copy-whole-paragraph)
   ("C-x c" copy-whole-buffer)
   ("C-x C" kill-whole-buffer)
   ("M-W" which-copy)
   ("M-w" smart-copy)
   ("C-x M-w" insert-cur-line)
   ("C-x M-W" insert-cur-sexp)
   ("C-M-w" copy-sentence)
   ;; 删除整行
   ("M-K" kill-line)
   ("C-k" smart-kill)
   ("C-\\" delete-indentation)
   ("C-x M-M" mark-invisible-region)
   ("M-U" del-to-begin)
   ("C-^" case-trans)
   ("C-6" case-trans)
   ("C-w" backward-kill-word-or-kill-region)
   ("C-x S" mark-whole-sexp)
   ("C-x W" kill-whole-sexp)
   ("C-x w" copy-sexp)
   ("M-D" my-kill-word)
   ("C-x TAB" indent-whole-buffer)
   ("C-h" delete-backward-char)
   ("C-z" undo)
   ("M-Y" redo)
   ("M-m" beginning-of-line-text)
   ("C-M-\\" smart-indent)
   ("M-q" fill-paragraph-justify)
   ("<escape> SPC" just-one-space)
   
   ("M-C-l" wcy-mark-some-thing-at-point)
   
   ;;emaci   
   ("C-x q" toggole-emaci-mode)
   ;;grep-setting   
   ("C-x F"   find-grep-in-current-dir)
   ("C-x f"   find-grep-in-dir)
   ("C-x M-f" find-grep-current-word-in-current-dir)
   ("C-x M-F" find-grep-current-word)
   ;;help-setting    
   ("C-x H" goto-help-buffer) 
   ;;hide-region-setting 
   ("C-x M-r" hide-region-hide)
   ("C-x M-R" hide-region-unhide)
   ;;info
   ("C-x I" info-max-window)
   ;;isearch 
   ("C-x M-s" isearch-forward-cur-word)
   ("M-n" next-error)
   ("M-p" previous-error)
   ;;maxframe   
   ("M-SPC x"   toggle-maximize-frame)
   ("M-SPC M-x" toggle-maximize-frame)
   ("M-SPC n"   minimize-frame)
   ("M-SPC c"   delete-frame)
   ("M-SPC M-c" delete-frame)
   ;;recent-jmp
   ("M-,"   recent-jump-backward)
   ("M-."   recent-jump-forward)
   ("C-x ," recent-jump-small-backward)
   ("C-x ." recent-jump-small-forward)
   ;;man
   ("C-x M" man)
   ))
;================major-map=================

(eal-define-keys
   'grep-mode-map
   `(("q"     bury-buffer)
     ("Q"     kill-this-buffer)
     ("1"     delete-other-windows)
     ("<"     beginning-of-buffer)
     (">"     end-of-buffer)
     ("'"     switch-to-other-buffer)
     ("u"     scroll-down)
     ("d"     scroll-up)
     ("S-SPC" View-scroll-half-page-backward)
     ("SPC"   View-scroll-half-page-forward)
     ("/"     describe-symbol-at-point)
     ("N"     select-buffer-forward)
     ("P"     select-buffer-backward)
     ("L"     count-brf-lines)))
     
(eal-define-keys
 'yas/keymap
 `(("M-j"     yas/next-field-or-maybe-expand)
   ("M-k"     yas/prev-field)))
   
(eal-define-keys
 'woman-mode-map
 `(("w"     scroll-down)
   ("v"     set-mark-command)))
   
(eal-define-keys
 'view-mode-map
 `(("U"           View-scroll-page-backward)
   ("/"           describe-symbol-at-point)
   ("\C-j"        goto-line)
   ("'"           switch-to-other-buffer)
   ("m"           back-to-indentation)
   ("p"           previous-line-or-backward-button)
   ("Q"           delete-current-window)
   ("L"           count-brf-lines)
   ("1"           delete-other-windows)
   ("<backspace>" c-electric-backspace)
   ("u"           View-scroll-half-page-backward)
   ("S-SPC"       View-scroll-half-page-backward)
   ("SPC"         View-scroll-half-page-forward)
   ("w"           scroll-down)
   ("d"           scroll-up)
   (","           find-symbol-go-back)
   ("1"           delete-other-windows)
   ("2"           split-window-vertically)
   ("3"           split-window-horizontally)
   ("B"           eval-buffer)))

(eal-define-keys
 '(emacs-lisp-mode-map c-mode-base-map makefile-mode-map makefile-automake-mode-map
                       sh-mode-map text-mode-map python-mode-map py-mode-map)
 `(("C-c T" my-template-expand-template)
   ("C-c C-t" template-expand-template)))

(eal-define-keys
 'outline-mode-map
 `(("C-M-h"   outline-mark-subtree)
   ("C-c u"   outline-up-heading)))

(eal-define-keys
 'Man-mode-map
 `(("Q"     Man-kill)
   ("1"     delete-other-windows)
   ("2"     split-window-vertically)
   ("3"     split-window-horizontally)
   ("u"     View-scroll-half-page-backward)
   ("S-SPC" View-scroll-half-page-backward)
   ("SPC"   View-scroll-half-page-forward)
   ("w"     scroll-down)
   ("d"     scroll-up)
   ("f"     am-forward-word-or-to-word)
   ("b"     emaci-b)
   ("n"     emaci-n)
   ("p"     emaci-p)
   ("N"     Man-next-section)
   ("P"     Man-previous-section)
   ("m"     back-to-indentation)
   ("M-j"   Man-goto-section)
   ("."     set-mark-command)
   ("c"     go-to-char-forward)
   ("g"     emaci-g)
   ("v"     set-mark-command)
   ("'"     switch-to-other-buffer)))

(eal-define-keys
  `(c-mode-base-map sh-mode-map)
  `(("C-c /" man-current-word)))

(eal-define-keys
 'Info-mode-map
 `(("j"         next-line)
   ("k"         previous-line)
   ("h"         backward-char)
   ("l"         forward-char)
   ("J"         emaci-roll-down)
   ("K"         emaci-roll-up)
   ("f"         am-forward-word-or-to-word)
   ("b"         backward-word)
   ("/"         describe-symbol-at-point)
   ("U"         Info-up)
   ("u"         View-scroll-half-page-backward)
   ("Q"         kill-this-buffer)
   ("o"         other-window)
   ("S-SPC"     View-scroll-half-page-backward)
   ("SPC"       View-scroll-half-page-forward)
   ("C-h"       Info-up)
   ("N"         Info-next-reference)
   ("P"         Info-prev-reference)
   ("'"         switch-to-other-buffer)
   ("."         find-symbol-at-point)
   ("<mouse-4>" mwheel-scroll)
   ("<mouse-5>" mwheel-scroll)
   ("C-c ,"     Info-history-back)
   ("w"         scroll-down)
   ("C-c ."     Info-history-forward)))

(eal-define-keys
   'help-mode-map
   `(("B"   help-go-back)
     ("F"   help-go-forward)
     ("f"   am-forward-word-or-to-word)
     ("d"   scroll-up)
     ("G"   end-of-buffer)
     ("g"   emaci-g)
     ("w"   scroll-down)
     ("v"   set-mark-command)
     ("C-h" help-go-back)
     ("C-;" help-go-forward)
     ("n"   forward-button)
     ("p"   backward-button)
     ("q"   delete-current-window)
     ("'"   switch-to-other-buffer)
     ("u"   View-scroll-half-page-backward)
     ("SPC" View-scroll-half-page-forward)
     ("."   find-symbol-at-point)
     ("/"   describe-symbol-at-point)))

(eal-define-keys
 'apropos-mode-map
 `(("u" scroll-down)
   ("1" delete-other-windows)
   ("n" forward-button)
   ("p" backward-button)))

(eal-define-keys
 'artist-mode-map
 `(("C-c l"   artist-select-op-line)
   ("C-c r"   artist-select-op-rectangle)
   ("C-c M-w" artist-select-op-copy-rectangle)
   ("C-c M-k" artist-select-op-cut-rectangle)
   ("C-c M-p" artist-select-op-paste)))

;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
(eal-define-keys
 'ac-complete-mode-map
 `(("<return>"   nil)
   ("RET"        nil)
   ("M-j"        ac-complete)
;;   ("M-."        ac-expand)
  ))

(define-key ac-mode-map (kbd "M-/") 'auto-complete)
   
(eal-define-keys
 `(c-mode-base-map)
 `(("C-h"     c-electric-backspace)
   ("C-c M-a" beginning-of-defun)
   ("C-c M-e" end-of-defun)
   ("C-c M-F" copy-current-fun-name)))
   

(eal-define-keys
 (append makefile-mode-map-list
         '(c-mode-base-map svn-status-mode-map sh-mode-map
                           compilation-mode-map ruby-mode-map
                           python-mode-map py-mode-map))
 `(("C-c C-m"  make)
   ("C-c m"    make-check)
   ("C-c M"    make-clean)
   ("C-c c"    compile-buffer)
   ("C-c r"    run-program)
   ("C-c C"    smart-compile)))

(eal-define-keys
 'java-mode-map
 `(("C-c C-m" ant)
   ("C-c M"	  ant-clean)
   ("C-c m"	  ant-test)))

;; 回车后indent
(eal-define-keys
 `(lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map sh-mode-map
                 ,(if (not is-before-emacs-21) 'awk-mode-map) 
                 ;;java-mode-map
                 ;;ruby-mode-map 
                 c-mode-base-map tcl-mode-map org-mode-map
                 python-mode-map 
                 ;;perl-mode-map
                 )
 `(("RET" newline-and-indent)))

 ;; 输入左大花扩号自动补齐右大花括号
(eal-define-keys
 `(c-mode-base-map awk-mode-map)
 `(("{" skeleton-c-mode-left-brace)))
 
(eal-define-keys
 'isearch-mode-map
 `(("C-h" dired-lis-isearch-up-directory)))
 
(eal-define-keys-commonly
     dired-mode-map
     `(("C-h"         dired-up-directory-same-buffer)
       ("<backspace>" dired-up-directory-same-buffer)
       ("'"           switch-to-other-buffer)
       ;("/"           dired-slash-map)
       ;("/m"          ywb-dired-filter-regexp)
       ;("/."          ywb-dired-filter-extension)
       ("C-q"         ywb-dired-quickview)
       ("r"           wdired-change-to-wdired-mode)
       ("C-s"         dired-lis-isearch-forward-always?)
       ("C-r"         dired-lis-isearch-backward-always?)
       ("ESC C-s"     dired-lis-isearch-forward-regexp-always?)
       ("ESC C-r"     dired-lis-isearch-backward-regexp-always?)
       ;; 让dired只使用一个buffer
       ("RET"         dired-lis-find-file-reuse-dir-buffer)
       ("<return>"    dired-lis-find-file-reuse-dir-buffer)
       ("M"           wuxch-mark-all-files-directories)
       ("g"           revert-buffer)
       ("M-o"         dired-omit-mode)
       ("M-Y"         dired-redo)
       ("C-k"         dired-do-delete)
       ("M-s"         dired-lis-off)
       ("q"           dired-lis-on)
       ("M"           dired-unmark)

       ("1"           delete-other-windows)
       ("2"           split-window-vertically)
       ("3"           split-window-horizontally)
       ("o"           other-window)

       ("j"           wuxch-dired-next-line)
       ("k"           wuxch-dired-previous-line)
       ("SPC"         dired-scroll-half-page-forward)
       ("u"           dired-scroll-half-page-backward)
       ("d"           dired-scroll-up)
       ("w"           dired-scroll-down)
       ("M->"         wuxch-dired-goto-last-line)
       ("M-<"         wuxch-dired-goto-first-line)

       ("M-w"         wuxch-dired-copy)
       ("C-y"         wuxch-dired-paste)
       ("M-k"         wuxch-dired-cut)

       ("c"           dired-do-copy)
       ("E"           dired-ediff)
       ("M-m"         dired-unmark-backward)
       ("C-c M-m"     dired-create-directory)
       
       ("C-c C-m"     make)
       ("C-c m"       make-check)
       ("C-c M"       make-clean)
       ("C-c c"       compile-buffer)
       ("C-c r"       run-program)
       ("C-c C"       smart-compile)
       ("C-c g"       gdb)
       ("C-c b"       gud-break)
       ("C-c B"       gud-remove)))


(eal-define-keys
 (append
  makefile-mode-map-list
  `(c-mode-base-map emacs-lisp-mode-map lisp-interaction-mode-map
                    conf-javaprop-mode-map html-mode-map tcl-mode-map
                    autoconf-mode-map perl-mode-map nxml-mode-map
                    python-mode-map graphviz-dot-mode-map))
 `(("C-c C-c" comment)))
 
(eal-define-keys
 'c-mode-base-map
  `(("C-c f" copy-function)
    ("C-c F" kill-function)
    ("C-c C" comment-function)
    ("C-M-h" mark-function)))

(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map)
 `(("C-M-h" mark-function)
   ("C-c D"  edebug-defun)
   ("C-c C-d" eval-defun)
   ("C-c B"  eval-buffer)
   ("C-c f" copy-function)
   ("C-c F" kill-function)
   ("C-c C-q" indent-function)
   ("C-c C" comment-function)))
   
(eal-define-keys
 'emaci-mode-map
 `(("/" describe-symbol-at-point)
   ("'" switch-to-other-buffer)
   ("L" count-brf-lines)
   ("]" goto-paren)
   ("c" go-to-char-forward)
   ("C" go-to-char-backward)))


(eal-define-keys
 `emacs-lisp-mode-map
 `(("C-c M-a" beginning-of-defun)
   ("C-c M-e" end-of-defun)))

;; I bind "C-x w" to `copy-sexp'
(eal-define-keys
'hi-lock-map
`(("C-x w" nil)))

(eal-define-keys
'emaci-mode-map
`(("p" emaci-p)))


(eal-define-keys
`(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map
                 c-mode-base-map text-mode-map ruby-mode-map html-mode-map)
        `(("C-c M-H" highlight-symbol-at-point)
        ("C-c M-R" highlight-symbol-remove-all)
        ("C-c M-N" highlight-symbol-next)
        ("C-c M-P" highlight-symbol-prev)
        ("C-c r"   highlight-symbol-query-replace)
        ("C-c M-n" highlight-symbol-next-in-defun)
        ("C-c M-p" highlight-symbol-prev-in-defun)))
     
(provide 'init-keybind)
;;; init-keybind.el ends here
