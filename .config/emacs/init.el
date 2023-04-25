;;; -*- lexical-binding: t; -*-

;; Setup fonts and config dir
(defvar vido/font-family "mononoki NF")
(defvar vido/default-font-size 160)
(defvar vido/default-variable-font-size 160)
(defvar config-directory (concat user-emacs-directory "config/"))

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

;; Reduce *Message* noise at startup. An empty scratch buffer (or the dashboard) is more than enough.
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

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
(setq dired-listing-switches "-AhgG --group-directories-first --time-style=+%d-%m-%y"
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

;; Enable this command, which is disabled for some reason
(put 'dired-find-alternate-file 'disabled nil)

;; Shell config
;; More at: https://www.masteringemacs.org/article/complete-guide-mastering-eshell
(setq explicit-shell-file-name "/usr/bin/zsh"
      shell-file-name "zsh"
      explicit-zsh-args '("--login" "--interactive"))

;; Use ibuffer instead of list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

(defun zsh-shell-mode-setup ()
  (setq-local comint-process-echoes t))
(add-hook 'shell-mode-hook 'zsh-shell-mode-setup)

;; Function to reload the user configuration.
(defun reload-config ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))
(load custom-file t)

;; Fancy welcome screen
;; Call after evil has loaded
(defun vido/show-welcome-buffer ()
  (interactive)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                   PACKAGES                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't auto-initialize.
(setq package-enable-at-startup nil)

;; Add additional package sources
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Install use-package
;; https://jwiegley.github.io/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose nil) ; Set to t for debugging

;; Load all *.el files recursively in config directory
(cl-loop for file in (reverse (directory-files-recursively config-directory "\\.el$"))
         do (load file))

;; Enable garbage collect magic
(use-package gcmh
  :ensure t
  :init
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 16 1024 1024) ; 16mb
        gcmh-verbose nil)
  :config
  (gcmh-mode 1))
