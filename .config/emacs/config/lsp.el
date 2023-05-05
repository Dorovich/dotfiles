;; -*- lexical-binding: t -*-

(use-package eglot
  :ensure t
  :commands eglot
  :init
  (add-hook 'c-mode-hook #'eglot-ensure)
  (add-hook 'c++-mode-hook #'eglot-ensure)
  :config
  (setq eglot-autoshutdown t))

(use-package company
  :ensure t
  :init
  (setq company-tooltip-limit 12
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t
        company-auto-commit nil
        company-idle-delay 0.3
        company-dabbrev-other-buffers nil
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-require-match 'never
        company-global-modes '(not erc-mode
                                   message-mode
                                   help-mode
                                   vterm-mode)
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend)
        company-backends '(company-dabbrev-code
                           company-capf
                           company-files))
  :config
  (add-hook 'after-init-hook 'global-company-mode))
