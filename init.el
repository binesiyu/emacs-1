;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-01-22 15:11:44 Wednesday by yubin>

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))

(require 'init-path)

;;my
(require 'init-my)
;;buildin-package
(require 'init-buildin)

;; Emacs中的包管理器
(require 'init-elpa)
(require 'init-package)

;; 一些基本的小函数
(require 'init-miscs-fun)

;; 利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
(require 'eval-after-load)

(require 'init-utils )

;; 一些Emacs的小设置
(require 'init-miscs)

;; 编码设置
(require 'init-settings-coding)

(require 'init-files)

;; 各种语言开发方面的设置
(require 'dev-settings)

;; 所有关于buffer方面的配置
(require 'all-buffer-settings)

;; frame-cmds.el必须放在multi-term前面,否则ediff退出时会出现错误
;; 而icicles soft-requires frame-cmds.el, 所以icicles也必须放在multi-term前面
;; emacs22下也必须放在kde-emacs前面, 否则会说shell-command是void-function
;; http://emacser.com/icicles-doremi-palette.htm
(require 'icicles-settings)
(require 'doremi-settings)
(require 'palette-settings)

;; edit-settings中对M-w重新定义,但是kde-emacs中也对其定义了
;; 所以必须要放在kde-emacs后面
(require 'edit-settings)

;; 图片mode
(require 'image-mode-settings)

(require 'init-display)

;; diff
(require 'diff-settings)

;; Emacs的diff: ediff
(require 'ediff-settings)

;; 在buffer中方便的查找字符串: color-moccur
(require 'moccur-settings)

;; Emacs超强的增量搜索Isearch配置
(require 'isearch-settings)

;; 非常酷的一个扩展。可以“所见即所得”的编辑一个文本模式的表格
(if is-before-emacs-21 (require 'table "table-for-21"))

(require 'init-publish)

;; Emacs可以做为一个server, 然后用emacsclient连接这个server,
;; 无需再打开两个Emacs
(require 'emacs-server-settings)

;; 所有关于查看帮助方面的配置
(require 'all-help-settings)

;; 以目录形式显示linkd文档
(require 'linkd-settings)

;; Emacs的超强文件管理器
(require 'dired-settings)

(require 'init-switch-major)

;; 查看Emacs内进程
(require 'list-processes+-settings)

(require 'view-mode-settings)

(am-add-hooks
 `(find-file-hook)
 (lambda ()
   (local-set-key (kbd "C-M-j") 'goto-line)))

;; 统计命令使用频率
(require 'command-frequence)

(require 'init-tools)

;; (require 'anything-settings)

(require 'ioccur)

;; 查询天气预报
(require 'weather-settings)

;; notification tool
(require 'todochiku-settings)


;; 模拟vi的点(.)命令
(require 'dot-mode)

;; Emacs才是世界上最强大的IDE － 用Emaci阅读文件
;; http://emacser.com/emaci.htm
(require 'emaci-settings)

;;;###autoload
(defun update-current-file-autoloads (file &optional save-after)
  "`update-file-autoloads' for current file."
  (interactive "fUpdate autoloads for file: \np")
  (let* ((load-file (expand-file-name "loaddefs.el"))
         (generated-autoload-file load-file))
    (unless (file-exists-p load-file)
      (shell-command (concat "touch " load-file)))
    (update-file-autoloads file save-after)))

;; 大纲mode
(require 'outline-settings)

;; org是一个非常强大的GTD工具
(require 'init-org)



;; 关闭buffer的时候, 如果该buffer有对应的进程存在, 不提示, 烦
(delq 'process-kill-buffer-query-function kill-buffer-query-functions)

(autoload 'org-open-file "org"
  "Open the file at PATH.
First, this expands any special file name abbreviations.  Then the
configuration variable `org-file-apps' is checked if it contains an
entry for this file type, and if yes, the corresponding command is launched.

If no application is found, Emacs simply visits the file.

With optional prefix argument IN-EMACS, Emacs will visit the file.
With a double \\[universal-argument] \\[universal-argument] \
prefix arg, Org tries to avoid opening in Emacs
and to use an external application to visit the file.

Optional LINE specifies a line to go to, optional SEARCH a string
to search for.  If LINE or SEARCH is given, the file will be
opened in Emacs, unless an entry from org-file-apps that makes
use of groups in a regexp matches.
If the file does not exist, an error is thrown.")

(defun open-file-with-app (file)
  "Open file with appropriate application."
  (interactive "fFile to open: ")
  (org-open-file file))

(defun open-current-file-with-app ()
  "Open current file with appropriate application."
  (interactive)
  (open-file-with-app buffer-file-name))

;; 一些有趣的东西
(require 'funny)

;; 模拟vi的f命令, 非常好用
(require 'go-to-char)


;; 在Emacs中使用真正的浏览器, 非常震撼
;;(when is-after-emacs-24
;;  (require 'ezbl-settings))

;; 轻量标记语言markdown
(require 'markdown-mode-settings)

;; 用chrome打开链接
(if (executable-find "chrome")
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "chrome"))

(require 'winpoint)
(window-point-remember-mode 1)

;; 高亮vi的配置文件
(require 'vimrc-mode)

(require 'comint-settings)

(require 'evernote-mode-settings)

;; session,可以保存很多东西，例如输入历史(像搜索、打开文件等的输入)、
;; register的内容、buffer的local variables以及kill-ring和最近修改的文件列表等。非常有用。
(require 'session-settings)

(require 'init-keybind)

;; 王纯业的desktop, 比desktop快多了
(require 'wcy-desktop-settings)

;; HACK: 要放在最后,免得会出现比较奇怪的现象
;; 保存和恢复工作环境
;; desktop,用来保存Emacs的桌面环境 — buffers、以及buffer的文件名、major modes和位置等等
;; (require 'desktop-settings)

;(sb-update)

;; 加载用户自己的配置
(load "~/my.emacs" t)
