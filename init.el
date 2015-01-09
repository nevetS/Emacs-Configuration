;;; Package --- Summary

;; This is the initialization file automatically loaded by emacs.  This file has
;; been customized to my personal preferences.

;;; Commentary:

;; Compatibility:  Emacs 24.x  Older versions should be supported with minor
;; changes.

;; The following plugins are enabled by this configuration:
;;  - yasnippet

;; Within the .emacs.d directory, there should be the following folders:
;;  - backups:    location of backup files
;;  - auto-saves: location of auto-save files
;;  - plugins:    location of plugins
;;  - elpa:       plugins installed via the Emacs package manager

;; This file is broken up as follows:
;;  - load paths
;;  - mode configuration
;;  - custom code
;;  - Emacs personalization

;; inline comments should explain what is going on.

;;load paths.  These are the locations of various Emacs plugins
;;  I like to keep Lisp code separated by placing each plugin into it's own
;;  directory.  That makes it easier to manage moving forward.

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/plugins/unbound/")
(add-to-list 'load-path "~/.emacs.d/plugins/autopair")
;(add-to-list 'load-path "~/.emacs.d/plugins/smartparens")
(add-to-list 'load-path "~/.emacs.d/plugins/graphviz/")
(add-to-list 'load-path "~/.emacs.d/plugins/linum/")
(add-to-list 'load-path "~/.emacs.d/plugins/markdownmode/")
;(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(add-to-list 'load-path "~/.emacs.d/plugins/window-number")
(add-to-list 'load-path "~/.emacs.d/plugins/fci")
(add-to-list 'load-path "~/.emacs.d/plugins/virtualenvwrapper")
(add-to-list 'load-path "~/.emacs.d/plugins/Pymacs")
(add-to-list 'load-path "~/.emacs.d/plugins/ac-etags")
(add-to-list 'load-path "~/.emacs.d/plugins/httprepl")
;(add-to-list 'load-path "~/.emacs.d/plugins/pymacs")

(setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.1.3")
(add-to-list 'load-path py-install-directory)

;;; MODE SECTION *******************
;;
;;  This section contains requirements and configuration for plugin

;PACKAGE
; Important keys and commands:
; - package-list-packages
;; disabled for Emacs 24.x.  Older versions require package.el
;(when
;    (load
;     (expand-file-name "~/.emacs.d/elpa/package.el"))
;  (package-initialize))
(require 'package)
;; elpa archive is installed by default, add melpa, melpa-stable, and gnu
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;YASNIPPET
; Important keys and commands:
; - yas-mode
; - TAB (to insert a snippet)
(require 'yasnippet) ;; not yasnippet-bundle
;    (setq yas/triggers-in-field 'True)
;    (yas/initialize)
;    (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
(setq yas-snippet-dirs
      '("~/.emacs.d/plugins/yasnippet-0.6.1c/snippets/text-mode"
	))
(yas-global-mode 1)
;end yasnippet section


;UNBOUND
; Important keys and commands:
; - describe-unbound-keys
;   - key complexity should be at least 5
(require 'unbound)

;AUTOPAIR
(set-default 'autopair-dont-activate #'(lambda () (eq major-mode 'graphviz-dot-mode)))
(require 'autopair)
(autopair-global-mode)


;GRAPHVIZ
; Requires graphviz installation
; Important keys and commands
; C-c: compile
; C-p: preview
(require 'graphviz-dot-mode)
;(load-file "~/.emacs.d/plugins/graphviz/graphviz-dot-mode.el")

;LINUM
; Importand keys and commands
; - linum-mode
(require 'linum)
(global-linum-mode 1)

;MARKDOWN
; Importand keys and commands
; - C-c C-a l insert hyperlink
; - C-c C-a f insert footnote
; - C-c C-i insert image
; - C-c C-c p preview in browser
(autoload 'markdown-mode "markdown-mode" "Major mode for editing markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;EXPAND-REGION
; Importand keys and commands
; - C-= expand region
; - M-= contract region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-=") 'er/contract-region)

;IDO MODE
; - C-x C-f C-f open a file without ido-mode enabled in mini-buffer
(require 'ido)
(ido-mode t)

;JEDI AUTO-COMPLETIONS
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;; ;AUTO-COMPLETIONS
;; ; Importand keys and commands
;; ; - C-i toggle through menu completions
;; (require 'auto-complete)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/dict")
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (global-auto-complete-mode t)

;; ;AUTO-COMPLETION SOURCE ETAGS
;; (require 'auto-complete-etags)
;; (setq-default ac-sources (add-to-list 'ac-sources 'ac-source-etags))

;PYTHON-MODE
; Importand keys and commands
; - C-c ! open python shell
; - C-c | pipe selection to shell
(require 'python-mode)
; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)
; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p nil)
(setq py-switch-buffers-on-execute-p nil)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

;WINDOW NUMBERING
(require 'window-number)
(window-number-mode)

;FILL COLUMN INDICATOR
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'python-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 79)
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "#7f9f7f")
(add-hook 'after-change-major-mode-hook 'fci-mode)

;FLYCHECK-GLOBAL-MODE
(add-hook 'after-init-hook 'global-flycheck-mode)

;FLYCHECK keymap prefix conflicts with Python Mode
; change C-c ! to C-c @
(defun change_flycheckprefix()
 (define-key flycheck-mode-map flycheck-keymap-prefix nil)
 (setq flycheck-keymap-prefix (kbd "C-c @"))
 (define-key flycheck-mode-map flycheck-keymap-prefix
                flycheck-command-map)
)

(eval-after-load "flycheck"
    '(progn
        (defun my-flycheck-mode-hook()
            (define-key flycheck-mode-map flycheck-keymap-prefix nil)
            (setq flycheck-keymap-prefix (kbd "C-c @"))
            (define-key flycheck-mode-map flycheck-keymap-prefix
                flycheck-command-map)
        )
        (add-hook 'flycheck-mode-hook 'my-flycheck-mode-hook)
     )
)


;;HTTP-REPL
(require 'httprepl)
;; DISABLED MODE CONFIGURATION *******************
;getting rid of autopair in favore of smartparens
;https://github.com/Fuco1/smartparens/wiki
; add modes to sp-ignore-mode-list to turn it off in them specifically
; M-x customize-group
;; (require 'smartparens-config)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode t)

;HASKELL-MODE
; Important keys and commands:
; This section is disabled
;the following section is for haskell mode
;(load "~/.emacs.d/plugins/haskell-mode-2.8.0/haskell-site-file")
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;(setq haskell-program-name "C:/Progra~1/Haskel~1/2011.2.0.1/bin/ghci.exe")

;CEDET
;; (load-file "~/.emacs.d/plugins/cedet-1.0/common/cedet.el")
;; (global-ede-mode 1)
;; (semantic-load-enable-code-helpers)
;; (require 'semantic-ia)
;; (require 'semantic-gcc)

;ENVIRONMENT SETTINGS ******************
(require 'color-theme)
(require 'color-theme-zenburn)
(eval-after-load "color-theme"
 '(progn
   (color-theme-initialize)
   (color-theme-zenburn)))

;disable scroll bars
(scroll-bar-mode -1)

;disable tool bar
(tool-bar-mode -1)

;menu bar available on ctrl-right click
(menu-bar-mode -99)

;TODO look up what this does
(setq x-select-enable-clipboard-manager nil)

;enables replacing of highlighted text
(delete-selection-mode 1)

;;; backups and auto-saves.

;The following pushes backups from the current directory into a backups
; directory
(setq
  backup-directory-alist '((".*" . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 6   ; how many of the newest versions to keep
  kept-old-versions 2    ; and how many of the old
  )



;The following pushes autosaves from the current directory into an
; autosaves directory
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))

;The following stops the creation of lockfiles.
; essentially, whenever a file is opened, if this is t, a sym link gets created
; .#filename->user@emacspid.12345
; This setting makes it so those files are not generated.
; It creates danger for simultaneous overwrites, but I'm not particularly concerned
; about that compared with directory timestamps, inode limits, and orphaned links 
; left by crashed sessions.
(setq create-lockfiles nil)
;the following line is in place so that when emacs is called
; from the command line with a file
; emacs will open in single-buffer mode
(setq inhibit-startup-screen t)
(add-hook 'emacs-startup-hook 'delete-other-windows)

(setq column-number-mode t)


;; (def parameter th-frame-config-register ?°
;;   "The register which is used for storing and restoring frame
;; configurations by `th-save-frame-configuration' and
;; `th-jump-to-register'.")

;; (defun th-save-frame-configuration (arg)
;;   "Stores the current frame configuration in register
;; `th-frame-config-register'. If a prefix argument is given, you
;; can choose which register to use."
;;   (interactive "P")
;;   (let ((register (if arg
;;                       (read-char "Which register? ")
;;                     th-frame-config-register)))
;;     (frame-configuration-to-register register)
;;     (message "Frame configuration saved in register '%c'."
;;              register)))

;; (defun th-jump-to-register (arg)
;;   "Jumps to register `th-frame-config-register'. If a prefix
;; argument is given, you can choose which register to jump to."
;;   (interactive "P")
;;   (let ((register (if arg
;;                       (read-char "Which register? ")
;;                     th-frame-config-register)))
;;     (jump-to-register register)
;;     (message "Jumped to register '%c'."
;;              register)))

;; (global-set-key (kbd "<F5>")
;;                 'th-save-frame-configuration)
;; (global-set-key (kbd "<F6>")
;;                 'th-jump-to-register)



(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/venvs/")

;;
;;
(setq org-use-speed-commands t)

;the following section is for pymacs
;(add-to-list 'pymacs-load-path "~/.emacs.d/plugins/Pymacs")

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;(autoload 'pymacs-autoload "pymacs")

;the following section is for ropemode
;in case rope mode f's up my keybindings
(setq ropemacs-enable-shortcust nil)
(setq ropemacs-local-prefix "C-c C-p")

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

;end pymacs section

;;; Code:
; this section is for personal functions that aren't big enough to put into
; their own separate plugin file


(defun c-end-line()
 (interactive)
 (call-interactively 'move-end-of-line)
 (unless (looking-back ";")(insert ";"))
 (newline-and-indent)
; (move-end-of-line)
)

(add-hook 'c-mode-common-hook
    (lambda()
      (local-set-key (kbd "M-n") 'c-end-line)))


(defun space-to-work()
 (local-set-key (kbd "M-p")(kbd "RET TAB")))
(add-hook 'c-mode-common-hook 'space-to-work)

; experimental
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

(require 'flymake)
(defun flymake-get-tex-args (file-name)
(list "pdflatex"
(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flymake-mode)

(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "C-c C-o") ; Or something else


;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(httprepl-content-type-alist
   (quote
    (("text/html" . html)
     ("application/json" . json)
     ("application/javascript" . js)
     ("text/xml" . xml)
     ("text/plain" . text)
     ("application/xml" . xml)
     ("html" . html)
     ("json" . json)
     ("javascript" . js)
     ("xml" . xml)
     ("text" . text))))
 '(httprepl-content-type-middleware-alist
   (quote
    ((html
      (lambda
	(b)
	(html-mode)
	b))
     (json
      (lambda
	(b)
	(json-mode)
	b))
     (js
      (lambda
	(b)
	(js-mode)
	b))
     (xml
      (lambda
	(b)
	(xml-mode)
	b))
     (text
      (lambda
	(b)
	(text-mode)
	b)))))
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
