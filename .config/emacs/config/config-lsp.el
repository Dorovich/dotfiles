;; -*- lexical-binding: t -*-

(use-package eglot
  :ensure t
  :commands eglot
  :init
  (add-hook 'c-mode-hook #'eglot-ensure)
  (add-hook 'c++-mode-hook #'eglot-ensure))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
