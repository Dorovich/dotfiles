(defvar my-font-mono "mononoki NF")
(defvar my-font-prose "IBM Plex Serif")
(defvar my-font-size 160) ; 160
(defconst emacs-tmp-dir
  (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))

;;; AESTHETIC EXTRAS
;; (load-file (expand-file-name "extras/tema-uni.el" user-emacs-directory))
;; (load-file (expand-file-name "extras/tema-portatil.el" user-emacs-directory))

(set-face-attribute 'default nil :font my-font-mono :height my-font-size)
(set-face-attribute 'fixed-pitch nil :font my-font-mono :height my-font-size)
(set-face-attribute 'variable-pitch nil :font my-font-prose :height my-font-size)

(shell-command "setxkbmap -option caps:ctrl_modifier" nil)
(shell-command "xset r rate 300 35" nil)

(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "<mouse-8>") 'previous-buffer)
(global-set-key (kbd "<mouse-9>") 'next-buffer)
(global-set-key (kbd "C-x r C-f") 'recentf-open-files)

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
      read-process-output-max (* 3 1024 1024) ;; 3mb
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
      large-file-warning-threshold (* 35 1024 1024) ;; 20mb
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

(global-auto-revert-mode t)
(show-paren-mode)
(blink-cursor-mode 0)
(set-fringe-mode 0)
(delete-selection-mode 1)
(display-time-mode 1)
(fido-mode 1)
(recentf-mode 1)

(defalias 'list-buffers 'ibuffer)

(fset 'yes-or-no-p 'y-or-n-p)

;; HOOKS
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-switch-to-saved-filter-groups "default")))
(add-hook 'text-mode-hook (lambda () (variable-pitch-mode 1)))
(add-hook 'org-mode-hook (lambda ()
                           (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
                           (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
                           (dolist (face '((org-document-title 1.4 bold)
                                           (org-level-1 1.4 bold)
                                           (org-level-2 1.3 normal)
                                           (org-level-3 1.2 normal)
                                           (org-level-4 1.1 normal)
                                           (org-level-5 1.1 normal)
                                           (org-level-6 1.1 normal)
                                           (org-level-7 1.1 normal)
                                           (org-level-8 1.1 normal)))
                             (set-face-attribute (nth 0 face) nil
                                                 :font my-font-prose
                                                 :height (nth 1 face)
                                                 :weight (nth 2 face)))))

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

;; PACKAGES
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi t)
  (set-cursor-color "#dbc49b"))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

;;; UTILITY EXTRAS
(load-file (expand-file-name "extras/dev.el" user-emacs-directory))
(load-file (expand-file-name "extras/lisp.el" user-emacs-directory))
(load-file (expand-file-name "extras/music.el" user-emacs-directory))
(load-file (expand-file-name "extras/experimental.el" user-emacs-directory))

;;; OTRAS COSITAS
;; https://config.phundrak.com/emacs.html
;; https://opensource.com/article/20/1/emacs-rpgs
;; https://github.com/zaeph/org-roll
