;;; -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(alpha . 100))

(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil
      tooltip-mode nil
      load-prefer-newer t
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
      inhibit-startup-message t
      frame-resize-pixelwise t
      echo-keystrokes 0.02
      show-paren-delay 0
      large-file-warning-threshold (* 35 1024 1024) ;; 20mb
      custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right
              cursor-in-non-selected-windows nil
              indent-tabs-mode nil
              left-margin-width 1
              right-margin-width 1
              c-basic-offset 4)

(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
  (setq native-comp-deferred-compilation nil))

(defvar default-font-family "mononoki NF")
(defvar default-font-size 160)
(defvar default-variable-font-size 160)
(defconst emacs-tmp-dir
  (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))

(set-face-attribute 'default nil
                    :font default-font-family
                    :height default-font-size)
(set-face-attribute 'fixed-pitch nil
                    :font default-font-family
                    :height default-font-size)
(set-face-attribute 'variable-pitch nil
                    :font default-font-family
                    :height default-font-size)

(global-auto-revert-mode t)
(show-paren-mode)
(blink-cursor-mode 0)
(set-fringe-mode 0)
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(load custom-file t)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(set-language-environment "UTF-8")

(defun reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))

(defun text-scale-reset ()
  (interactive)
  (text-scale-set 0))

(defun display-startup-echo-area-message ()
  (message nil))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; undo-tree

(use-package undo-tree
  :ensure t
  :config
  (setq undo-tree-history-directory-alist '(("." . "/tmp")))
  (with-eval-after-load 'image-mode
    (setq undo-tree-auto-save-history nil))
  (global-undo-tree-mode 1))

;; evil

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil        ; for evil-collection
        evil-want-C-u-scroll t
        evil-want-Y-yank-to-eol t
        evil-normal-state-cursor '(box "#dbc49b")
        evil-insert-state-cursor '((bar . 2) "#dbc49b")
        evil-visual-state-cursor '(hollow "#dbc49b")
        evil-split-window-below t
        evil-split-window-right t
        evil-undo-system 'undo-tree)
  :config
  (evil-define-key 'normal 'global
    (kbd "ñ") 'evil-ex
    (kbd "U") 'evil-redo
    (kbd "C-+") 'text-scale-increase
    (kbd "C--") 'text-scale-decrease
    (kbd "C-=") 'text-scale-reset
    "gcc" 'comment-or-uncomment-region)
  (evil-mode 1))

;; evil-collection

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

;; evil-escape

(use-package evil-escape
  :ensure t
  :after evil
  :config
  (setq-default evil-escape-key-sequence "jk"
                evil-escape-delay 0.2
                ;; hay que excluir estados/modos porque sino se lagea
                evil-escape-excluded-states '(normal visual)
                evil-escape-excluded-major-modes '(ibuffer-mode dired-mode))
  (evil-escape-mode 1))

;; evil-anzu 

(use-package evil-anzu
  :ensure t
  :after evil
  :config
  (global-anzu-mode 1)) 

;; evil-surround

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode 1)) 

;; paredit

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode lisp-mode lisp-interaction-mode scheme-mode) . enable-paredit-mode)
  :init
  (add-hook 'sly-repl-mode-hook (lambda () (paredit-mode 1))))

;; theme

(use-package srcery-theme
  :ensure t
  :config
  (setq srcery-transparent-background t)
  (setq srcery-black "#151515" ; el color "#1e2127" hace que se vea feo org-mode y los numeros de linea
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
  (setq srcery-hard-black "#151515"
        srcery-gray-1 srcery-hard-black
        srcery-gray-2 srcery-bright-black ; for doom-modeline
        srcery-gray-3 srcery-hard-black
        srcery-gray-4 srcery-hard-black
        srcery-gray-5 srcery-hard-black)
  (load-theme 'srcery :no-confirm)
  (set-background-color "#151515")
  (set-face-background 'mode-line "#3a3a3a")
  (set-face-background 'mode-line-inactive "#222222"))

;; rainbow

(use-package rainbow-mode
  :ensure t
  :defer t
  :hook org-mode prog-mode conf-mode
  :config
  (defun rainbow-turn-off-words ()
    "Turn off word colours in rainbow-mode."
    (interactive)
    (font-lock-remove-keywords
     nil
     `(,@rainbow-x-colors-font-lock-keywords
       ,@rainbow-latex-rgb-colors-font-lock-keywords
       ,@rainbow-r-colors-font-lock-keywords
       ,@rainbow-html-colors-font-lock-keywords
       ,@rainbow-html-rgb-colors-font-lock-keywords))
    (font-lock-fontify-buffer)))

(add-hook 'rainbow-mode-hook #'rainbow-turn-off-words)

;; ibuffer

(use-package ibuffer
  :ensure t
  :defer t
  :config
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

  (ad-activate 'ibuffer-update-title-and-summary))

;; nerd-icons-ibuffer

(use-package nerd-icons-ibuffer
  :ensure t
  :after (:all ibuffer nerd-icons)
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

;; org

(use-package org
  :defer t
  :config
  (require 'org-tempo) ; abreviaciones como <s o <E
  (setq org-image-actual-width nil
        org-hide-leading-stars t
        org-startup-folded nil
        org-startup-indented t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-return-follows-link t
        org-html-validation-link nil))

(with-eval-after-load 'org
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

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("󰪥" "" "" "󰴈")))

(use-package toc-org
  :ensure t
  :commands toc-org-enable
  :hook (org-mode . toc-org-enable))

;; dired

(use-package dired
  :defer t
  :config
  (evil-define-key 'normal dired-mode-map
    [mouse-1] 'dired-find-file
    (kbd "l") 'dired-find-file
    (kbd "<right>") 'dired-find-file
    (kbd "h") 'dired-up-directory
    (kbd "<left>") 'dired-up-directory
    (kbd "q") 'kill-this-buffer
    (kbd "'") 'bookmark-jump
    (kbd "/") 'dired-narrow)
  (setq dired-listing-switches "-AhgG --group-directories-first --time-style=+%d-%m-%y"
        dired-dwim-target t))

;; dired-narrow

(use-package dired-narrow
  :ensure t
  :after dired)

;; diredfl

(use-package diredfl
  :ensure t
  :after dired
  :init
  (add-hook 'dired-mode-hook 'diredfl-mode))

;; nerd-icons-dired

(use-package nerd-icons-dired
  :ensure t
  :after (:all dired nerd-icons)
  :hook (dired-mode . nerd-icons-dired-mode))

;; counsel

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        enable-recursive-minibuffers t)
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :after ivy
  :config
  ;; Remove the leading `^` from the input of counsel-M-x.
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "")
  (ivy-mode 1)
  (counsel-mode))

;; sly

(use-package sly
  :ensure t
  :defer t
  :init
  (setq-default sly-symbol-completion-mode nil)
  :config
  (add-to-list 'exec-path "/usr/local/bin")
  (setq inferior-lisp-program "sbcl"))

;; lua-mode

(use-package lua-mode
  :ensure t)

;; sudo-edit

(use-package sudo-edit
  :ensure t
  :defer t)

;; vterm

(use-package vterm
  :ensure t
  :config
  (setq shell-file-name "/bin/zsh"
        vterm-max-scrollback 2500))

(use-package vterm-toggle
  :ensure t
  :after vterm
  :config
  (global-set-key (kbd "C-x t t") 'vterm-toggle-cd)
  (setq vterm-toggle-fullscreen-p nil
        vterm-toggle-scope 'frame)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                 (display-buffer-reuse-window display-buffer-at-bottom)
                 ;;(display-buffer-reuse-window display-buffer-in-direction)
                 ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                 ;;(direction . bottom)
                 ;;(dedicated . t) ;dedicated is supported in emacs27
                 (reusable-frames . visible)
                 (window-height . 0.3))))

;; doom-modeline

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; which-key

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order
        which-key-allow-imprecise-window-fit nil
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.8
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit nil
        which-key-separator " 󰜴 " ))

;; corfu

(use-package corfu
  :ensure t
  :init
  (setq completion-cycle-threshold 3
        tab-always-indent 'complete)
  (global-corfu-mode 1))

;; gcmh

(use-package gcmh
  :ensure t
  :config
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 16 1024 1024) ; 16mb
        gcmh-verbose nil)
  (add-hook 'emacs-startup-hook 'gcmh-mode))
