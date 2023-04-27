;; -*- lexical-binding: t -*-

(use-package ibuffer
  :commands ibuffer
  :defer t
  :config
  (setq ibuffer-show-empty-filter-groups nil
        ibuffer-display-summary nil
        ibuffer-filter-group-name-face '(:inherit (success bold))
        ibuffer-formats
        '((mark modified read-only locked
                " " (icon 2 2 :left :elide)
                " " (name 18 18 :left :elide)
                " " (size 9 -1 :right)
                " " (mode 16 16 :left :elide)
                " " filename-and-process)
          (mark " " (name 16 -1)
                " " filename))
        ibuffer-saved-filter-groups
        '(("default"
           ("Dired" (mode . dired-mode))
           ("Emacs" (or
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$"))))))

  ;; Buffer icons column for GUI
  (define-ibuffer-column icon (:name "  ")
    (let ((icon (if (and (buffer-file-name)
                         (all-the-icons-auto-mode-match?))
                    (all-the-icons-icon-for-file (file-name-nondirectory (buffer-file-name)) :v-adjust -0.05)
                  (all-the-icons-icon-for-mode major-mode :v-adjust -0.05))))
      (if (symbolp icon)
          (setq icon (all-the-icons-faicon "file-o" :face 'all-the-icons-dsilver :height 0.8 :v-adjust 0.0))
        icon)))

  ;; Redefine size column to display human readable size
  (define-ibuffer-column size (:name "Size"
                                     :inline t
                                     :header-mouse-map ibuffer-size-header-map)
    (file-size-human-readable (buffer-size)))

  (defun ibuffer-set-custom-filter ()
    (ibuffer-switch-to-saved-filter-groups "default"))
  (add-hook 'ibuffer-mode-hook 'ibuffer-set-custom-filter)

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
