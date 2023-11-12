(defvar my-font-mono "mononoki NF")
(defvar my-font-prose "Roboto Serif")
(defvar my-font-size 165)
(defconst emacs-tmp-dir
  (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))

;;; OTHER THEMES
;; (load-file (expand-file-name "extras/tema-uni.el" user-emacs-directory))
;; (load-file (expand-file-name "extras/tema-portatil.el" user-emacs-directory))

(set-face-attribute 'default nil :family my-font-mono :height my-font-size)
(set-face-attribute 'fixed-pitch nil :family my-font-mono :height my-font-size)
(set-face-attribute 'variable-pitch nil :family my-font-prose :height my-font-size)

(shell-command "setxkbmap -option caps:ctrl_modifier" nil)
(shell-command "xset r rate 300 35" nil)

(global-set-key (kbd "<mouse-8>") 'previous-buffer)
(global-set-key (kbd "<mouse-9>") 'next-buffer)
(global-set-key (kbd "C-x r C-f") 'recentf-open-files)
(global-set-key (kbd "C-z") 'undo)

;;; SETTINGS
(setq load-prefer-newer t
      idle-update-delay 1.0
      history-delete-duplicates t
      highlight-nonselected-windows nil
      ffap-machine-p-known 'reject
      frame-inhibit-implied-resize t
      inhibit-compacting-font-caches t
      comp-async-report-warnings-errors nil
      frame-inhibit-implied-resize t
      auto-mode-case-fold nil
      read-process-output-max (* 3 1024 1024) ; 3mb
      initial-major-mode 'fundamental-mode
      make-backup-files nil
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      use-dialog-box nil
      ring-bell-function 'ignore
      frame-resize-pixelwise t
      echo-keystrokes 0.02
      show-paren-delay 0
      image-use-external-converter t
      completion-styles '(basic initials substring)
      current-language-environment "UTF-8"
      large-file-warning-threshold (* 35 1024 1024) ; 35mb
      gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"
      auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
      backup-directory-alist `((".*" . ,emacs-tmp-dir))
      custom-file (expand-file-name "custom.el" user-emacs-directory)
      dired-listing-switches "-AhgG --group-directories-first --time-style=+%d-%m-%y"
      fancy-splash-image (expand-file-name "pics/butterfly-hd.png" user-emacs-directory)
      display-time-format "%H:%M"
      scheme-program-name "csi -:c"
      ;; ORG
      org-image-actual-width nil
      org-pretty-entities t
      org-hide-leading-stars t
      org-hide-macro-markers t
      org-startup-folded nil
      org-startup-indented t
      org-startup-align-all-tables t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t
      org-fontify-whole-heading-line t
      org-src-fontify-natively t
      org-return-follows-link t
      org-html-validation-link nil
      org-export-preserve-breaks t
      org-export-with-date nil
      org-export-time-stamp-file nil
      org-export-with-author nil
      org-image-actual-width 600
      org-redisplay-inline-images nil
      org-display-inline-images nil
      org-ellipsis "…"
      ;; IBUFFER
      ibuffer-show-empty-filter-groups nil
      ibuffer-display-summary nil
      ibuffer-filter-group-name-face '(:inherit (success bold))
      ibuffer-expert t
      ibuffer-use-other-window nil
      ibuffer-saved-filter-groups '(("default"
	                             ("Dired" (mode . dired-mode))
                                     ("ERC" (mode . erc-mode))
	                             ("Emacs" (or
		                               (name . "^\\*scratch\\*$")
		                               (name . "^\\*Messages\\*$")))))
      ;; ERC
      erc-server "irc.libera.chat"
      erc-nick "dorovich"
      erc-user-full-name nil
      erc-track-shorten-start 8
      erc-kill-buffer-on-part t
      erc-auto-query 'bury)

(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right
              cursor-in-non-selected-windows nil
              indent-tabs-mode nil
              left-margin-width 1
              right-margin-width 1
              c-basic-offset 4)

(global-auto-revert-mode 1)
(show-paren-mode 1)
(blink-cursor-mode 0)
(set-fringe-mode 0)
(delete-selection-mode 1)
;; (display-time-mode 1)
(fido-mode 1)
(recentf-mode 1)
(save-place-mode 1)

(defalias 'list-buffers 'ibuffer)

(fset 'yes-or-no-p 'y-or-n-p)

;;; HOOKS
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-switch-to-saved-filter-groups "default")))
(add-hook 'text-mode-hook (lambda () (variable-pitch-mode 1)))
(add-hook 'org-mode-hook (lambda () (variable-pitch-mode 1)))

;;; FUNCTIONS
(defun reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))

(defun dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (call-process "xdg-open" nil 0 nil file)
    (message "Opening %s done" file)))

;;; PACKAGES
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-mixed-fonts t
        ;; modus-themes-org-blocks 'gray-background
        ;; modus-themes-common-palette-overrides '((border-mode-line-active unspecified)
        ;;                                         (border-mode-line-inactive unspecified))
        modus-themes-headings '((0 . (1.2))
                                (1 . (1.4))
                                (2 . (1.3))
                                (3 . (1.2))
                                (4 . (1.1)))
        modus-vivendi-palette-overrides '((cursor yellow-faint)
                                          (fg-heading-1 yellow-cooler)
                                          (fg-heading-2 maroon)
                                          (fg-heading-3 indigo)
                                          (fg-heading-4 olive)))
  (load-theme 'modus-vivendi t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package gcmh
  :ensure t
  :init
  (setq gcmh-idle-delay 10
        gcmh-high-cons-threshold (* 16 1024 1024) ; 16mb
        gcmh-verbose nil)
  (add-hook 'emacs-startup-hook 'gcmh-mode))

;;; UTILITY EXTRAS
(load-file (expand-file-name "extras/dev.el" user-emacs-directory))
(load-file (expand-file-name "extras/lisp.el" user-emacs-directory))
(load-file (expand-file-name "extras/music.el" user-emacs-directory))
(load-file (expand-file-name "extras/experimental.el" user-emacs-directory))

;;; COSITAS
;; https://config.phundrak.com/emacs.html
;; https://opensource.com/article/20/1/emacs-rpgs
;; https://github.com/zaeph/org-roll
