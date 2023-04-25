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
  ;; Evil global keybinds
  (evil-define-key 'normal 'global
    (kbd "ñ") 'evil-ex
    (kbd "U") 'evil-redo
    (kbd "C-+") 'text-scale-increase
    (kbd "C--") 'text-scale-decrease)
  ;; Time to be evil
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :requires evil
  :config
  (evil-collection-init))

(use-package undo-tree
  :ensure t
  :after evil
  :config
  ;; Enable undo-tree for Evil
  (setq undo-tree-history-directory-alist '(("." . "/tmp")))
  (global-undo-tree-mode 1))

(use-package key-chord
  :ensure t
  :requires evil
  :config
  ;; Enable key-chord to exit insert mode in Evil
  (setq key-chord-two-keys-delay 0.2)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(with-eval-after-load 'evil
  (when (< (length command-line-args) 2)
    (add-hook 'emacs-startup-hook (lambda ()
                                    (when (display-graphic-p)
                                      (vido/show-welcome-buffer))))))
