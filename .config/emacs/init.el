;;; -*- lexical-binding: t; -*-

;; Setup fonts and config directory.
(defvar default-font-family "mononoki NF")
(defvar default-font-size 160)
(defvar default-variable-font-size 160)
(defvar config-directory (concat user-emacs-directory "config/"))

;; Fonts.
(set-face-attribute 'default nil
                    :font default-font-family
                    :height default-font-size)
(set-face-attribute 'fixed-pitch nil
                    :font default-font-family
                    :height default-font-size)
(set-face-attribute 'variable-pitch nil
                    :font default-font-family
                    :height default-font-size)

;; Add a one character margin at the sides of the window.
(setq-default left-margin-width 1
              right-margin-width 1)

;; Reduce *Message* noise at startup.
;; An empty scratch buffer (or the dashboard) is more than enough.
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

;; Show current key sequence in minibuffer.
(setq echo-keystrokes 0.02)

;; Line wrapping by words on text mode.
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Enable highlighting of the current line.
(global-hl-line-mode 1)

;; Disable blinking cursor.
(blink-cursor-mode 0)

;; y-or-n-p makes answering questions faster.
(fset 'yes-or-no-p 'y-or-n-p)

;; Selected text will be overwritten when you start typing.
(delete-selection-mode 1)

;; Line wrapping by words on text mode.
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Dired file display and sorting.
(setq dired-listing-switches "-AhgG --group-directories-first --time-style=+%d-%m-%y"
      dired-dwim-target t)

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Case insensitive completion.
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

;; Write customizations to a separate file instead of this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Gives right-click a context menu.
(global-set-key [mouse-3] #'mouse-popup-menubar-stuff)

;; Comment a line or region, if there is one.
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region"
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (forward-line)))

;; Convenient keymap to un/comment lines.
(global-set-key (kbd "C-;") #'comment-or-uncomment-region-or-line)

;; Auto-update buffer if file has changed on disk.
(global-auto-revert-mode t)

;; Shell config.
;; More at: https://www.masteringemacs.org/article/complete-guide-mastering-eshell
(setq explicit-shell-file-name "/usr/bin/zsh"
      shell-file-name "zsh"
      explicit-zsh-args '("--login" "--interactive"))

;; Use ibuffer instead of list-buffers.
(global-set-key (kbd "C-x C-b") 'ibuffer)

(defun zsh-shell-mode-setup ()
  (setq-local comint-process-echoes t))
(add-hook 'shell-mode-hook 'zsh-shell-mode-setup)

;; Function to reload the user configuration.
(defun reload-config ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

;; Macro to defer execution until packages load
;;; https://github.com/bling/dotemacs/blob/master/core/core-boot.el
(defmacro after (feature &rest body)
  "Executes BODY after FEATURE has been loaded.
FEATURE may be any one of:
    'evil            => (with-eval-after-load 'evil BODY)
    \"evil-autoloads\" => (with-eval-after-load \"evil-autoloads\" BODY)
    [evil cider]     => (with-eval-after-load 'evil
                          (with-eval-after-load 'cider
                            BODY))
"
  (declare (indent 1))
  (cond
   ((vectorp feature)
    (let ((prog (macroexp-progn body)))
      (cl-loop for f across feature
               do
               (progn
                 (setq prog (append `(',f) `(,prog)))
                 (setq prog (append '(with-eval-after-load) prog))))
      prog))
   (t
    `(with-eval-after-load ,feature ,@body))))

;; Fancy welcome screen.
(defun show-welcome-buffer ()
  (interactive)
  "Show *Welcome* buffer."
  (with-current-buffer (get-buffer-create "*Welcome*")
    (setq truncate-lines t)
    (let* ((buffer-read-only)
           (image-path "~/.config/emacs/pics/reimu.png")
           (image (create-image image-path))
           (size (image-size image))
           (height (cdr size))
           (width (car size))
           (top-margin (floor (/ (- (window-height) height) 2)))
           (left-margin (floor (/ (- (window-width) width) 2)))
           (title "¡Bienvenido a Emacs!"))
      (erase-buffer)
      (goto-char (point-min))
      (insert (make-string top-margin ?\n))
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

;; Startup initial message.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "--> Emacs ha iniciado en %s con %d recogidas de basura."
                     (format "%.2f segundos"
                             (float-time (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Packages setup -->

;; Don't auto-initialize packages.
(setq package-enable-at-startup nil)

;; Add additional package sources.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Install use-package.
;; https://jwiegley.github.io/use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose nil) ; Set to t for debugging

;; Load all *.el files recursively in config directory.
(cl-loop for file in (reverse (directory-files-recursively config-directory "\\.el$"))
         do (load file))
