;; -*- lexical-binding: t -*-

(use-package ibuffer
  :commands ibuffer
  :defer t
  :config
  (setq ibuffer-show-empty-filter-groups nil
        ibuffer-display-summary nil
        ibuffer-filter-group-name-face '(:inherit (success bold))
        ibuffer-expert t
        ibuffer-use-other-window nil
        ibuffer-saved-filter-groups
        '(("default"
           ("Dired" (mode . dired-mode))
           ("Emacs" (or
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$"))))))

  (defun ibuffer-set-custom-filter ()
    (ibuffer-switch-to-saved-filter-groups "default"))
  (add-hook 'ibuffer-mode-hook 'ibuffer-set-custom-filter)

  (add-hook 'ibuffer-mode-hook 'ibuffer-auto-mode)

  (defadvice ibuffer-update-title-and-summary (after remove-column-titles)
    (with-current-buffer "*Ibuffer*"
      (read-only-mode 0)
      (goto-char 1)
      (search-forward "-\n" nil t)
      (delete-region 1 (point))
      (let ((window-min-height 1)) 
        ;; save a little screen estate
        (shrink-window-if-larger-than-buffer))
      (read-only-mode 1)))
  (ad-activate 'ibuffer-update-title-and-summary))

(use-package all-the-icons-ibuffer
  :ensure t
  :hook ibuffer-mode
  :config
  (setq all-the-icons-ibuffer-display-predicate #'display-graphic-p
        all-the-icons-ibuffer-human-readable-size t
        all-the-icons-ibuffer-color-icon t))
