;; -*- lexical-binding: t -*-

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil ; for evil-collection
        evil-want-C-u-scroll t
        evil-want-Y-yank-to-eol t
        evil-normal-state-cursor '(box "#dbc49b")
        evil-insert-state-cursor '((bar . 2) "#dbc49b")
        evil-visual-state-cursor '(hollow "#dbc49b")
        evil-split-window-below t
        evil-split-window-right t
        evil-undo-system 'undo-tree)
  :config
  (setq evil-normal-state-tag " NORMAL "
        evil-insert-state-tag " INSERT "
        evil-visual-state-tag " VISUAL "
        evil-motion-state-tag " MOTION "
        evil-emacs-state-tag " EMACS "
        evil-replace-state-tag " REPLACE "
        evil-operator-state-tag " OPERATOR ")
  ;; Evil global keybinds
  (evil-define-key 'normal 'global
    (kbd "ñ") 'evil-ex
    (kbd "U") 'evil-redo
    (kbd "C-+") 'text-scale-increase
    (kbd "C--") 'text-scale-decrease
    (kbd "C-,") 'dired-jump)
  (evil-define-key 'visual 'global
    (kbd "TAB") 'indent-region)
  ;; Time to be evil
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :requires evil
  :config
  (evil-collection-init))

(use-package evil-escape
  :ensure t
  :requires evil
  :config
  (setq-default evil-escape-key-sequence "jk"
                evil-escape-delay 0.2)
  (evil-escape-mode 1))

(use-package evil-surround
  :ensure t
  :requires evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-anzu
  :ensure t
  :requires evil
  :config
  (global-anzu-mode 1))

(use-package evil-numbers
  :ensure t
  :requires evil
  :config
  (evil-define-key 'normal 'global
    (kbd "C-c +") 'evil-numbers/inc-at-pt
    (kbd "C-c -") 'evil-numbers/dec-at-pt
    (kbd "<kp-add>") 'evil-numbers/inc-at-pt
    (kbd "<kp-subtract>") 'evil-numbers/dec-at-pt))

(use-package undo-tree
  :ensure t
  :after evil
  :config
  ;; Enable undo-tree for Evil
  (setq undo-tree-history-directory-alist '(("." . "/tmp")))
  (global-undo-tree-mode 1))

(after 'evil
  (when (< (length command-line-args) 2)
    (add-hook 'emacs-startup-hook (lambda ()
                                    (when (display-graphic-p)
                                      (show-welcome-buffer))))))
