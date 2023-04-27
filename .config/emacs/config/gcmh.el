;; -*- lexical-binding: t -*-

;; Enable garbage collect magic
(use-package gcmh
  :ensure t
  :init
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 16 1024 1024) ; 16mb
        gcmh-verbose nil)
  :config
  (add-hook 'emacs-startup-hook 'gcmh-mode))
