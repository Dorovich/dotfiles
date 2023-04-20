;; init.el gc values (faster loading)
(setq gc-cons-threshold (* 128 1024 1024)
      gc-cons-percentage 0.6)

;; Emacs "updates" its ui more often than it needs to, so we slow it down slightly from 0.5s
(setq idle-update-delay 1.0)

;; Disable bidirectional text rendering for a modest performance boost.
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)

;; Reduce rendering/line scan work for Emacs by not rendering cursors or regions
;; in non-focused windows.
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Don't ping things that look like domain names.
(setq ffap-machine-p-known 'reject)

;; Setup fonts
(defvar vido/font-family "mononoki NF")
(defvar vido/default-font-size 160)
(defvar vido/default-variable-font-size 160)

(set-face-attribute 'default nil
                    :font vido/font-family
                    :height vido/default-font-size)
(set-face-attribute 'fixed-pitch nil
                    :font vido/font-family
                    :height vido/default-font-size)
(set-face-attribute 'variable-pitch nil
                    :font vido/font-family
                    :height vido/default-variable-font-size)

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

;; Do not load outdated byte code files.
(setq load-prefer-newer t)

;; Give some breathing room
(set-fringe-mode 1)

;; Default was too low; Increase for better lsp performance.
(setq read-process-output-max (* 3 1024 1024)) ;; 3mb

;; Dark theme.
(load-theme 'wombat)
(set-face-background 'default "#151515")

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Workaround for https://debbugs.gnu.org/34341 in GNU Emacs <= 26.3.
(when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Write customizations to a separate file instead of this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Enable installation of packages from MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; From https://irreal.org/blog/?p=8243
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Install packages.
;;;; nano-modeline para el pc de la uni!!
;;;; (nano-modeline-mode) despues de instalarlo
(dolist (package '(slime paredit rainbow-delimiters undo-tree evil evil-collection
                         all-the-icons key-chord all-the-icons-dired dired-open hide-mode-line))
  (unless (package-installed-p package)
    (package-install package)))

;; Configure SBCL as the Lisp program for SLIME.
(add-to-list 'exec-path "/usr/local/bin")
(setq inferior-lisp-program "sbcl")

;; Enable Paredit.
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
(defun override-slime-del-key ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-del-key)

;; Enable Rainbow Delimiters.
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)

;; Configure and enable Evil and Evil-collection
(setq evil-want-integration t
      evil-want-keybinding nil ; for Evil-collection
      evil-want-C-u-scroll t
      evil-want-Y-yank-to-eol t
      evil-normal-state-cursor '(box "#dbc49b")
      evil-insert-state-cursor '((bar . 2) "#dbc49b")
      evil-visual-state-cursor '(hollow "#dbc49b")
      evil-split-window-below t
      evil-split-window-right t
      evil-undo-system 'undo-tree)
(evil-mode 1)
(evil-collection-init) ; must be done after evil mode is activated

;; Enable undo-tree for Evil
(setq undo-tree-history-directory-alist '(("." . "/tmp")))
(global-undo-tree-mode 1) ; in emacs < 28.1

;; Enable key-chord to exit insert mode in Evil
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

;; Enable dired icons
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; Customize Rainbow Delimiters.
(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray

;; Configure hide-mode-line
(add-hook 'dired-mode-hook 'hide-mode-line-mode)
(add-hook 'eshell-mode-hook 'hide-mode-line-mode)
(add-hook 'completion-list-mode-hook 'hide-mode-line-mode)

;; Configure dired-open external programs
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("jpeg" . "sxiv")
                              ("png" . "sxiv")
                              ("pdf" . "zathura")
                              ("cbz" . "zathura")
                              ("mkv" . "mpv")
                              ("webm" . "mpv")
                              ("mp4" . "mpv")
                              ("xcf" . "gimp")))

;; y-or-n-p makes answering questions faster.
(fset 'yes-or-no-p 'y-or-n-p)

;; Selected text will be overwritten when you start typing.
(delete-selection-mode 1)

;; Function to reload the user configuration.
(defun reload-config ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

;; Gives right-click a context menu
(global-set-key [mouse-3] 'mouse-popup-menubar-stuff)

;; Matching parenthesis color
(set-face-background 'show-paren-match "#346475")

(setq initial-scratch-message "")

;; Put Emacs auto-save and backup files to /tmp/ or C:/Temp/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))

;; Change autosave dir to tmp
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
      backup-directory-alist `((".*" . ,emacs-tmp-dir)))

;; Auto-update buffer if file has changed on disk
(global-auto-revert-mode t)

;; Evil keybinds
(evil-define-key 'normal 'global
  (kbd "ñ") 'evil-ex
  (kbd "U") 'evil-redo
  (kbd "C-+") 'text-scale-increase
  (kbd "C--") 'text-scale-decrease)

(with-eval-after-load 'dired
  (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
  (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file)) ; use dired-find-file if not using dired-open package

;; Set frame size by pixels, not by character height
(setq frame-resize-pixelwise t)

;; Enable highlighting of the current line
(global-hl-line-mode 1)
(set-face-foreground 'highlight nil)
(set-face-attribute hl-line-face nil
                    :foreground nil
                    :background "#222222"
                    :underline nil)

;; Cursor configuration
(blink-cursor-mode 0)
(set-cursor-color "#dbc49b")

;; Use fundamental mode for starting buffer so to not load a lot of packages
(setq initial-major-mode 'fundamental-mode)

;; Show current key sequence in minibuffer
(setq echo-keystrokes 0.02)

;; Shell config
;; More at: https://www.masteringemacs.org/article/complete-guide-mastering-eshell
(setq explicit-shell-file-name "/usr/bin/zsh")
(setq shell-file-name "zsh")
(setq explicit-zsh-args '("--login" "--interactive"))
(defun zsh-shell-mode-setup ()
  (setq-local comint-process-echoes t))
(add-hook 'shell-mode-hook #'zsh-shell-mode-setup)

;; Fancy welcome screen
(with-eval-after-load 'evil
    (defun vido/show-welcome-buffer ()
    "Show *Welcome* buffer."
    (with-current-buffer (get-buffer-create "*Welcome*")
        (setq truncate-lines t)
        (let* ((buffer-read-only)
            (image-path "~/.emacs.d/emacs.png")
            (image (create-image image-path))
            (size (image-size image))
            (height (cdr size))
            (width (car size))
            (top-margin (floor (/ (- (window-height) height) 2)))
            (left-margin (floor (/ (- (window-width) width) 2)))
            (title "¡Bienvenido a Emacs!"))
        (erase-buffer)
        ;;(setq mode-line-format nil) ; if not using hide-mode-line-mode
        ;;(hide-mode-line-mode) ; if using hide-mode-line-mode
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

    (when (< (length command-line-args) 2)
    (add-hook 'emacs-startup-hook (lambda ()
                                    (when (display-graphic-p)
                                        (vido/show-welcome-buffer))))))

;; Startup welcome message
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "--> Emacs ha iniciado en %s con %d recogidas de basura."
                     (format "%.2f segundos"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Undo gc values post init.el.
(setq gc-cons-threshold 100000000
      gc-cons-percentage 0.1)
