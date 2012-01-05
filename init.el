;The following pushes backups from the current directory into a backups
; directory
(setq backup-directory-alist '((".*" . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;The following pushes autosaves from the current directory into an
; autosaves directory
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))

;the following section is for pymacs(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
;end pymacs section

;the following section is for yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
    (setq yas/triggers-in-field 'True)
    (yas/initialize)
    (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
    
;end yasnippet section


;the following section is for ropemode
;in case rope mode f's up my keybindings
;(setq ropemacs-enable-shortcust nil)
;(setq ropemacs-local-prefix "C-c C-p)
;(add-to-list 'load-path "~/.emacs.d/plugins/pymacs")
;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")

;the following section is for haskell mode
(load "~/.emacs.d/plugins/haskell-mode-2.8.0/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)        
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent) 
;(setq haskell-program-name "C:/Progra~1/Haskel~1/2011.2.0.1/bin/ghci.exe")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 106 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(delete-selection-mode 1);enables replacing of highlighted text
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/")
(require 'color-theme)
(require 'color-theme-zenburn)
(eval-after-load "color-theme"
 '(progn
   (color-theme-initialize)
   (color-theme-zenburn)))

;commented out cedet
;(load-file "~/.emacs.d/plugins/cedet-1.0/common/cedet.el")
;'(global-ede-mode 1)
;(semantic-load-enable-code-helpers)
;(require 'semantic-ia)
;(require 'semantic-gcc)

(add-to-list 'load-path "~/.emacs.d/plugins/unbound/")
(require 'unbound)

;may have to add this hook to perl-mode, python, etc.
(defun my-cedet-hook()
 (local-set-key (kbd "M-RET") 'semantic-ia-complete-symbol-menu))
 (add-hook 'c-mode-common-hook 'my-cedet-hook)

;(defun my-cool-return(&optional n)
; (interactive "p")
; (move-end-of-line)
; (unless(looking-back ";")
;   (insert ";")))
;; (newline-and-indent))

(defun my-cool-return()
 (interactive)
 (call-interactively 'move-end-of-line)
 (unless (looking-back ";")(insert ";"))
 (newline-and-indent)
; (move-end-of-line)
)

 (add-hook 'c-mode-common-hook 
    (lambda()
      (local-set-key (kbd "M-n") 'my-cool-return)))


(defun gimme-space-to-work()
 (local-set-key (kbd "M-p")(kbd "RET TAB")))
 (add-hook 'c-mode-common-hook 'gimme-space-to-work)
(add-to-list 'load-path "~/.emacs.d/plugins/autopair")
(require 'autopair)
(autopair-global-mode)

;add line number mode
;for vertical aligned line numbers
(add-to-list 'load-path "~/.emacs.d/plugins/linum/")
(require 'linum)

;the following line is in place so that when emacs is called
; from the command line with a file
; emacs will open in single-buffer mode
(setq inhibit-startup-screen t)
(add-hook 'emacs-startup-hook 'delete-other-windows)