;;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.6)

;; ui changes first!

(add-to-list 'default-frame-alist '(alpha . 100))

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

;; then the rest...

(defvar default-font-family "monospace")
(defvar default-font-size 130)
(defvar default-variable-font-size 130)
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))

(set-face-attribute 'default nil
                    :font default-font-family
                    :height default-font-size)
(set-face-attribute 'fixed-pitch nil
                    :font default-font-family
                    :height default-font-size)
(set-face-attribute 'variable-pitch nil
                    :font default-font-family
                    :height default-font-size)

(setq load-prefer-newer t
      idle-update-delay 1.0
      history-delete-duplicates t
      highlight-nonselected-windows nil
      ffap-machine-p-known 'reject
      frame-inhibit-implied-resize t
      inhibit-compacting-font-caches t
      comp-async-report-warnings-errors nil
      frame-inhibit-implied-resize t
      mode-line-format nil
      auto-mode-case-fold nil
      read-process-output-max (* 3 1024 1024) ;; 3mb
      initial-major-mode 'fundamental-mode
      auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
      backup-directory-alist `((".*" . ,emacs-tmp-dir))
      make-backup-files nil
      gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      use-dialog-box nil
      ring-bell-function 'ignore
      initial-scratch-message nil
      inhibit-startup-screen t
      frame-resize-pixelwise t
      echo-keystrokes 0.02
      show-paren-delay 0
      custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right
              cursor-in-non-selected-windows nil
              indent-tabs-mode nil)

(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))

(global-auto-revert-mode t)
(show-paren-mode)
(blink-cursor-mode 0)
(set-fringe-mode 0)
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(load custom-file t)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(defun reload-config ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package '(evil evil-collection undo-tree key-chord gcmh))
  (unless (package-installed-p package)
    (package-install package)))

;; evil

(setq evil-want-integration t
      evil-want-keybinding nil ; for evil-collection
      evil-want-C-u-scroll t
      evil-want-Y-yank-to-eol t
      evil-normal-state-cursor '(box "#dbc49b")
      evil-insert-state-cursor '((bar . 2) "#dbc49b")
      evil-visual-state-cursor '(hollow "#dbc49b")
      evil-split-window-below t
      evil-split-window-right t
      evil-undo-system 'undo-tree)

(evil-define-key 'normal 'global
  (kbd "ñ") 'evil-ex
  (kbd "U") 'evil-redo
  (kbd "C-+") 'text-scale-increase
  (kbd "C--") 'text-scale-decrease)

(evil-define-key 'visual 'global
  (kbd "TAB") 'indent-region)

;; evil-collection

(evil-collection-init)

;; undo-tree

(setq undo-tree-history-directory-alist '(("." . "/tmp")))
(global-undo-tree-mode 1)

;; key-chord

(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

;; ibuffer

(setq ibuffer-show-empty-filter-groups nil
      ibuffer-display-summary nil
      ibuffer-filter-group-name-face '(:inherit (success bold))
      ibuffer-saved-filter-groups
      '(("default"
         ("Dired" (mode . dired-mode))
         ("Emacs" (or
                   (name . "^\\*scratch\\*$")
                   (name . "^\\*Messages\\*$"))))))

(defun ibuffer-set-custom-filter ()
  (ibuffer-switch-to-saved-filter-groups "default"))

(add-hook 'ibuffer-mode-hook 'ibuffer-set-custom-filter)

;; gcmh

(setq gcmh-idle-delay 5
      gcmh-high-cons-threshold (* 16 1024 1024) ; 16mb
      gcmh-verbose nil)

(add-hook 'emacs-startup-hook 'gcmh-mode)
