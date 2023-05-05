;; -*- lexical-binding: t -*-

(use-package slime
  :defer t
  :config
  (add-to-list 'exec-path "/usr/local/bin")
  (setq inferior-lisp-program "sbcl"))

;; (use-package paredit
;;   :ensure t
;;   :hook (emacs-lisp-mode
;;          eval-expression-minibuffer-setup
;;          ielm-mode
;;          lisp-interaction-mode
;;          lisp-mode
;;          slime-repl-mode)
;;   :config
;;   (defun override-slime-del-key ()
;;     (define-key slime-repl-mode-map
;;       (read-kbd-macro paredit-backward-delete-key) nil))
;;   (add-hook 'slime-repl-mode-hook 'override-slime-del-key))

(use-package parinfer-rust-mode
  :ensure t
  :hook (emacs-lisp-mode
         eval-expression-minibuffer-setup
         ielm-mode
         lisp-interaction-mode
         lisp-mode
         slime-repl-mode))
