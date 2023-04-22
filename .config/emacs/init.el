;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                OPTIMIZATIONS                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; init.el gc values (faster loading)
(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.6)

;; Do not load outdated byte code files.
(setq load-prefer-newer t)

;; Emacs "updates" its ui more often than it needs to, so we slow it down slightly from 0.5s
(setq idle-update-delay 1.0)

;; No need to keep duplicates in prompt history.
(setq history-delete-duplicates t)

;; Disable bidirectional text rendering for a modest performance boost.
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)

;; Reduce rendering/line scan work for Emacs by not rendering cursors or regions
;; in non-focused windows.
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Don't ping things that look like domain names.
(setq ffap-machine-p-known 'reject)

;; Silence compiler warnings as they can be pretty disruptive
(setq comp-async-report-warnings-errors nil)
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))

;; Get rid of "For information about GNU Emacs..." message at startup,
;; unless we're in a daemon session
(unless (daemonp)
  (advice-add #'display-startup-echo-are-message :override #'ignore))

;; Disable second passing of auto-mode-alist
(setq auto-mode-case-fold nil)

;; Give some breathing room
(set-fringe-mode 0)

;; Default was too low; Increase for better lsp performance.
(setq read-process-output-max (* 3 1024 1024)) ;; 3mb

;; Workaround for https://debbugs.gnu.org/34341 in GNU Emacs <= 26.3.
(when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Use fundamental mode for starting buffer so to not load a lot of packages
(setq initial-major-mode 'fundamental-mode)

;; From https://irreal.org/blog/?p=8243
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Put Emacs auto-save and backup files to /tmp/ or C:/Temp/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))

;; Change autosave dir to tmp
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
      backup-directory-alist `((".*" . ,emacs-tmp-dir)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CUSTOMIZATIONS                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setup fonts
(defvar vido/font-family "mononoki NF")
(defvar vido/default-font-size 160)
(defvar vido/default-variable-font-size 160)

;; Fonts
(set-face-attribute 'default nil
                    :font vido/font-family
                    :height vido/default-font-size)
(set-face-attribute 'fixed-pitch nil
                    :font vido/font-family
                    :height vido/default-font-size)
(set-face-attribute 'variable-pitch nil
                    :font vido/font-family
                    :height vido/default-variable-font-size)

;; Add a one character margin at the sides of the window
(setq-default left-margin-width 1
              right-margin-width 1)

;; Show nothing on scratch buffer
(setq initial-scratch-message "")

;; Show current key sequence in minibuffer
(setq echo-keystrokes 0.02)

;; Line wrapping by words on text mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Enable highlighting of the current line
(global-hl-line-mode 1)

;; Disable blinking cursor
(blink-cursor-mode 0)

;; y-or-n-p makes answering questions faster.
(fset 'yes-or-no-p 'y-or-n-p)

;; Selected text will be overwritten when you start typing.
(delete-selection-mode 1)

;; Set frame size by pixels, not by character height
(setq frame-resize-pixelwise t)

;; Line wrapping by words on text mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Dired file display and sorting
(setq dired-listing-switches "-AhgG --group-directories-first --time-style=+%D"
      dired-dwim-target t)

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Case insensitive completion
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

;; Write customizations to a separate file instead of this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Gives right-click a context menu
(global-set-key [mouse-3] 'mouse-popup-menubar-stuff)

;; Auto-update buffer if file has changed on disk
(global-auto-revert-mode t)

;; Shell config
;; More at: https://www.masteringemacs.org/article/complete-guide-mastering-eshell
(setq explicit-shell-file-name "/usr/bin/zsh")
(setq shell-file-name "zsh")
(setq explicit-zsh-args '("--login" "--interactive"))
(defun zsh-shell-mode-setup ()
  (setq-local comint-process-echoes t))
(add-hook 'shell-mode-hook #'zsh-shell-mode-setup)

;; Function to reload the user configuration.
(defun reload-config ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))
(load custom-file t)

;; Fancy welcome screen
;; Call after evil has loaded
(defun vido/show-welcome-buffer ()
  "Show *Welcome* buffer."
  (with-current-buffer (get-buffer-create "*Welcome*")
    (setq truncate-lines t)
    (let* ((buffer-read-only)
           (image-path "~/.config/emacs/emacs.png")
           (image (create-image image-path))
           (size (image-size image))
           (height (cdr size))
           (width (car size))
           (top-margin (floor (/ (- (window-height) height) 2)))
           (left-margin (floor (/ (- (window-width) width) 2)))
           (title "¡Bienvenido a Emacs!"))
      (erase-buffer)
      (goto-char (point-min))
      (insert (make-string top-margin ?\n ))
      (insert (make-string left-margin ?\ ))
      (insert-image image)
      (insert "\n\n\n")
      (insert (make-string (floor (/ (- (window-width) (string-width title)) 2)) ?\ ))
      (insert title))
    (setq cursor-type nil)
    (read-only-mode +1)
    (switch-to-buffer (current-buffer))
    ;;(local-set-key (kbd "q") 'kill-this-buffer) ; if not using evil-mode
    (evil-local-set-key 'normal (kbd "q") 'kill-this-buffer)))

;; Startup initial message
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "--> Emacs ha iniciado en %s con %d recogidas de basura."
                     (format "%.2f segundos"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Install use-package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                   PACKAGES                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://jwiegley.github.io/use-package

(require 'use-package)
(setq use-package-verbose nil) ; Set to t for debugging

(use-package evil
  :ensure t
  :init
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
  :config
  ;; Evil keybinds
  (evil-define-key 'normal 'global
    (kbd "ñ") 'evil-ex
    (kbd "U") 'evil-redo
    (kbd "C-+") 'text-scale-increase
    (kbd "C--") 'text-scale-decrease)
  ;; Time to be evil
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :requires evil
  :config
  (evil-collection-init))

(use-package key-chord
  :ensure t
  :requires evil
  :config
  ;; Enable key-chord to exit insert mode in Evil
  (setq key-chord-two-keys-delay 0.2)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-common-palette-overrides
        '((bg-main "#151515")
          (keyword red-faint)
          (builtin yellow-cooler)
          (fnname green-faint)
          (fg-heading-1 red-faint)
          (bg-hl-line "#222222")
          (border-mode-line-active bg-mode-line-active)
          (border-mode-line-inactive bg-mode-line-inactive)
          ))
  (load-theme 'modus-vivendi :no-confirm))

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :requires all-the-icons
  :hook dired-mode)

(use-package dired-open
  :ensure t
  :defer t
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("jpeg" . "sxiv")
                                ("png" . "sxiv")
                                ("pdf" . "zathura")
                                ("cbz" . "zathura")
                                ("mkv" . "mpv")
                                ("webm" . "mpv")
                                ("mp4" . "mpv")
                                ("mp3" . "mpv")
                                ("flac" . "mpv")
                                ("xcf" . "gimp"))))

(use-package slime
  :ensure t
  :defer t
  :config
  (add-to-list 'exec-path "/usr/local/bin")
  (setq inferior-lisp-program "sbcl"))

(use-package paredit
  :ensure t
  :hook (emacs-lisp-mode
         eval-expression-minibuffer-setup
         ielm-mode
         lisp-interaction-mode
         lisp-mode
         slime-repl-mode)
  :config
  (defun override-slime-del-key ()
    (define-key slime-repl-mode-map
      (read-kbd-macro paredit-backward-delete-key) nil))
  (add-hook 'slime-repl-mode-hook 'override-slime-del-key))

(use-package rainbow-delimiters
  :ensure t
  :hook (emacs-lisp-mode
         ielm-mode
         lisp-interaction-mode
         lisp-mode
         slime-repl-mode))

(use-package undo-tree
  :ensure t
  :after evil
  :config
  ;; Enable undo-tree for Evil
  (setq undo-tree-history-directory-alist '(("." . "/tmp")))
  (global-undo-tree-mode 1))

(use-package hide-mode-line
  :ensure t
  :hook (dired-mode
         eshell-mode
         completion-list-mode))

(use-package org
  :defer t)

(with-eval-after-load 'dired
  (evil-define-key 'normal dired-mode-map [mouse-1] 'dired-open-file)
  (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file if not using dired-open package
  (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory))

(with-eval-after-load 'org
  (setq org-image-actual-width nil
        org-hide-leading-stars t
        org-startup-folded nil
        org-startup-indented t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-return-follows-link t)
  (dolist
      (face
       '((org-level-1 1.3 ultra-bold)
         (org-level-2 1.15 extra-bold)
         (org-level-3 1.07 bold)
         (org-level-4 1.04 semi-bold)
         (org-level-5 1.02 normal)
         (org-level-6 1.01 normal)
         (org-level-7 1.005 normal)
         (org-level-8 1.003 normal)))
    (set-face-attribute (nth 0 face) nil
                        :font vido/font-family
                        :height (nth 1 face)
                        :weight (nth 2 face))))

(with-eval-after-load 'evil
  (when (< (length command-line-args) 2)
    (add-hook 'emacs-startup-hook (lambda ()
                                    (when (display-graphic-p)
                                      (vido/show-welcome-buffer))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Undo gc values post init.el.
(setq gc-cons-threshold 100000000
      gc-cons-percentage 0.1)
(put 'dired-find-alternate-file 'disabled nil)
