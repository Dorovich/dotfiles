;; -*- lexical-binding: t -*-

(use-package diminish
  :ensure t)

(with-eval-after-load 'undo-tree
  (diminish 'undo-tree-mode))

(with-eval-after-load 'anzu
  (diminish 'anzu-mode))

(with-eval-after-load 'evil-collection-unimpaired
  (diminish 'evil-collection-unimpaired-mode))
