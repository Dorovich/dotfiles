;; -*- lexical-binding: t -*-

(use-package modus-themes
  :ensure t
  :config
  (setq modus-vivendi-palette-overrides
        '((bg-main "#151515")
          (bg-hl-line "#222222")
          (keyword red-faint)
          (builtin yellow-cooler)
          (fnname green-faint)
          (fg-prompt red-faint)
          (fg-heading-1 red-faint)
          (bg-mode-line-active "#363636")
          (bg-mode-line-inactive "#222222")
          (border-mode-line-active bg-mode-line-active)
          (border-mode-line-inactive bg-mode-line-inactive)))
  (load-theme 'modus-vivendi :no-confirm))

(use-package hide-mode-line
  :ensure t
  :hook (dired-mode
         eshell-mode
         completion-list-mode))

;; (use-package rainbow-delimiters
;;   :ensure t
;;   :defer t
;;   :hook (emacs-lisp-mode
;;          ielm-mode
;;          lisp-interaction-mode
;;          lisp-mode
;;          slime-repl-mode))

(use-package all-the-icons
  :ensure t
  :after (:any dired ibuffer))

;; (use-package autothemer
;;   :ensure t)
