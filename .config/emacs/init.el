;;; -*- lexical-binding: t; -*-

;; ui changes first!

(add-to-list 'default-frame-alist '(alpha . 100))

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

;; then the rest...

(defvar default-font-family "mononoki NF")
(defvar default-font-size 160)
(defvar default-variable-font-size 160)
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
              indent-tabs-mode nil
              left-margin-width 1
              right-margin-width 1)

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

(with-eval-after-load 'org
  (setq org-image-actual-width nil
        org-hide-leading-stars t
        org-startup-folded nil
        org-startup-indented t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-return-follows-link t)
  ;; Set different font sizes to headers
  (dolist
      (face
       '((org-level-1 1.3 ultra-bold)
         (org-level-2 1.15 extra-bold)
         (org-level-3 1.10 bold)
         (org-level-4 1.07 semi-bold)
         (org-level-5 1.04 normal)
         (org-level-6 1.02 normal)
         (org-level-7 1.01 normal)
         (org-level-8 1.005 normal)))
    (set-face-attribute (nth 0 face) nil
                        :font default-font-family
                        :height (nth 1 face)
                        :weight (nth 2 face))))

(defun reload-config ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package '(evil evil-collection evil-surround evil-anzu
                        evil-escape undo-tree dired-narrow diredfl
                        diminish gcmh srcery-theme slime))
  (unless (package-installed-p package)
    (package-install package)))

;; evil

(setq evil-want-integration t
      evil-want-keybinding nil ; for evil-collection
      evil-want-C-u-scroll t
      evil-want-Y-yank-to-eol t
      ; evil-normal-state-cursor '(box "#dbc49b")
      ; evil-insert-state-cursor '((bar . 2) "#dbc49b")
      ; evil-visual-state-cursor '(hollow "#dbc49b")
      evil-normal-state-cursor '(box)
      evil-insert-state-cursor '((bar . 2))
      evil-visual-state-cursor '(hollow)
      evil-split-window-below t
      evil-split-window-right t
      evil-undo-system 'undo-tree)

(require 'evil)

(evil-define-key 'normal 'global
  (kbd "ñ") 'evil-ex
  (kbd "U") 'evil-redo
  (kbd "C-+") 'text-scale-increase
  (kbd "C--") 'text-scale-decrease)

(evil-define-key 'visual 'global
  (kbd "C-c") 'evil-change-to-initial-state)

(evil-mode 1)

(global-evil-surround-mode 1) ; evil-surround
(global-anzu-mode 1) ; evil-anzu

;; evil-collection

(require 'evil-collection)
(evil-collection-init)

;; evil-escape

(require 'evil-escape)
(setq-default evil-escape-key-sequence "jk"
              evil-escape-delay 0.2
              evil-escape-excluded-states '(visual)
              evil-escape-excluded-major-modes '(ibuffer-mode))
(evil-escape-mode 1)

;; undo-tree

(require 'undo-tree)
(setq undo-tree-history-directory-alist '(("." . "/tmp")))
(global-undo-tree-mode 1)

;; theme

(require 'srcery-theme)
(setq srcery-transparent-background t)
(setq srcery-black "#1e2127"
      srcery-red "#e06c75"
      srcery-green "#98c379"
      srcery-yellow "#d19a66"
      srcery-blue "#7e9cd8"
      srcery-magenta "#c678dd"
      srcery-cyan "#56b6c2"
      srcery-white "#d1d1d1")
(setq srcery-bright-black "#464646"
      srcery-bright-red "#e06c75"
      srcery-bright-green "#98c379"
      srcery-bright-yellow "#d19a66"
      srcery-bright-blue "#7e9cd8"
      srcery-bright-magenta "#c678dd"
      srcery-bright-cyan "#56b6c2"
      srcery-bright-white "#d1d1d1")
(setq srcery-dark-red "#e06c75"
      srcery-dark-green "#98c379"
      srcery-dark-blue "#7e9cd8"
      srcery-dark-cyan "#346475")
(load-theme 'srcery)

(set-background-color "#151515")
(set-face-background 'mode-line "#3a3a3a")
(set-face-background 'mode-line-inactive "#222222")

;; ibuffer

(require 'ibuffer)

(setq ibuffer-show-empty-filter-groups nil
      ibuffer-display-summary nil
      ibuffer-filter-group-name-face '(:inherit (success bold))
      ibuffer-expert t
      ibuffer-use-other-window nil
      ibuffer-saved-filter-groups
      '(("default"
         ("Dired" (mode . dired-mode))
         ("Emacs" (or
                   (name . "^\\*scratch\\*$")
                   (name . "^\\*Messages\\*$"))))))

(defun ibuffer-set-custom-filter ()
  (ibuffer-switch-to-saved-filter-groups "default"))

(add-hook 'ibuffer-mode-hook 'ibuffer-set-custom-filter)

(add-hook 'ibuffer-mode-hook 'ibuffer-auto-mode)

(defadvice ibuffer-update-title-and-summary (after remove-column-titles)
  (with-current-buffer "*Ibuffer*")
  (read-only-mode 0)
  (goto-char 1)
  (search-forward "-\n" nil t)
  (delete-region 1 (point))
  (read-only-mode 1))

(ad-activate 'ibuffer-update-title-and-summary)

;; dired

(evil-define-key 'normal dired-mode-map
  [mouse-1] 'dired-find-file
  (kbd "l") 'dired-find-file
  (kbd "<right>") 'dired-find-file
  (kbd "h") 'dired-up-directory
  (kbd "<left>") 'dired-up-directory
  (kbd "q") 'kill-this-buffer
  (kbd "'") 'bookmark-jump
  (kbd "/") 'dired-narrow)

(add-hook 'dired-mode-hook 'diredfl-mode)

;; slime

(add-to-list 'exec-path "/usr/local/bin")
(setq inferior-lisp-program "sbcl")

;; diminish

(require 'diminish)
(with-eval-after-load 'undo-tree (diminish 'undo-tree-mode))
(with-eval-after-load 'anzu (diminish 'anzu-mode))
(with-eval-after-load 'evil-collection-unimpaired
  (diminish 'evil-collection-unimpaired-mode))
(with-eval-after-load 'eldoc (diminish 'eldoc-mode))
(with-eval-after-load 'paredit (diminish 'paredit-mode))
(with-eval-after-load 'evil-escape (diminish 'evil-escape-mode))

;; gcmh

(require 'gcmh)

(setq gcmh-idle-delay 5
      gcmh-high-cons-threshold (* 16 1024 1024) ; 16mb
      gcmh-verbose nil)

(add-hook 'emacs-startup-hook 'gcmh-mode)
