(add-to-list 'default-frame-alist '(alpha . 100))

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 1)        ; Give some breathing room

(menu-bar-mode -1)          ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell nil)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(defvar efs/default-font-size 150)
(defvar efs/default-variable-font-size 150)

(set-face-attribute 'default nil :font "mononoki NF" :height efs/default-font-size)
(set-face-attribute 'fixed-pitch nil :font "mononoki NF" :height efs/default-font-size)
(set-face-attribute 'variable-pitch nil :font "mononoki NF" :height efs/default-variable-font-size)

;;Setup Package.el To Work With MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-refresh-contents)
(package-initialize)

;;Use-Package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;;Evil Mode
(use-package evil
  :ensure t
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (evil-mode))
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
(use-package key-chord
  :ensure t
  :config
  (setq key-chord-two-keys-delay 0.2)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(use-package all-the-icons)
(use-package warm-night-theme)
(use-package nano-modeline
  :init (nano-modeline-mode))

;; Using garbage magic hack.
 (use-package gcmh
   :config
   (gcmh-mode 1))
;; Setting garbage collection threshold
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(load-theme 'wombat)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Silence compiler warnings as they can be pretty disruptive
(setq comp-async-report-warnings-errors nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5111a41453244802afd93eed1a434e612a8afbdf19c52384dffab129258bab6e" default))
 '(package-selected-packages '(gcmh evil-collection evil use-package cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Silence compiler warnings as they can be pretty disruptive
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))
;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)

(evil-define-key 'normal 'global (kbd "ñ") 'evil-ex)
(evil-define-key 'normal 'global (kbd "U") 'evil-redo)
(evil-define-key 'normal 'global (kbd "<C-=>") 'text-scale-adjust)
(evil-define-key 'normal 'global (kbd "<C-+>") 'text-scale-increase)
(evil-define-key 'normal 'global (kbd "<C-->") 'text-scale-decrease)
