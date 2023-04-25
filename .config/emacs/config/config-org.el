;; -*- lexical-binding: t -*-

(use-package org
  :defer t)

(with-eval-after-load 'org
  (setq org-image-actual-width nil
        org-hide-leading-stars t
        org-startup-folded nil
        org-startup-indented t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-return-follows-link t)
  ;; Set different font sizes to headers
  (dolist
      (face
       '((org-level-1 1.3 ultra-bold)
         (org-level-2 1.15 extra-bold)
         (org-level-3 1.10 bold)
         (org-level-4 1.07 semi-bold)
         (org-level-5 1.04 normal)
         (org-level-6 1.02 normal)
         (org-level-7 1.01 normal)
         (org-level-8 1.005 normal)))
    (set-face-attribute (nth 0 face) nil
                        :font vido/font-family
                        :height (nth 1 face)
                        :weight (nth 2 face))))
