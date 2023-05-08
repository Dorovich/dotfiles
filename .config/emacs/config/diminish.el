;; -*- lexical-binding: t -*-

(use-package diminish
  :ensure t)

(after 'undo-tree (diminish 'undo-tree-mode))
(after 'anzu (diminish 'anzu-mode))
(after 'evil-collection-unimpaired (diminish 'evil-collection-unimpaired-mode))
(after 'eldoc (diminish 'eldoc-mode))
(after 'paredit (diminish 'paredit-mode))
(after 'evil-escape (diminish 'evil-escape-mode))
