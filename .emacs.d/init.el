;; init.el gc values (faster loading)
(setq gc-cons-threshold (* 384 1024 1024)
      gc-cons-percentage 0.6)

;; Emacs "updates" its ui more often than it needs to, so we slow it down slightly from 0.5s
(setq idle-update-delay 1.0)

;; Disable second passing of auto-mode-alist
(setq auto-mode-case-fold nil)

;; Do not load outdated byte code files.
(setq load-prefer-newer t)

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
(dolist (package '(slime paredit rainbow-delimiters undo-tree evil evil-collection
                         all-the-icons key-chord all-the-icons-dired dired-open))
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
(evil-define-key 'normal 'global (kbd "ñ") 'evil-ex)
(evil-define-key 'normal 'global (kbd "U") 'evil-redo)
(evil-define-key 'normal 'global (kbd "C-+") 'text-scale-increase)
(evil-define-key 'normal 'global (kbd "C--") 'text-scale-decrease)

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

(setq initial-major-mode 'fundamental-mode)
