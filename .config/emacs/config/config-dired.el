;; -*- lexical-binding: t -*-

(use-package dired
  :commands (dired-mode dired)
  :defer t)

(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :hook dired-mode)

(use-package dired-open
  :ensure t
  :after dired
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("jpeg" . "sxiv")
                                ("png" . "sxiv")
                                ("webp" . "sxiv")
                                ("pdf" . "zathura")
                                ("cbz" . "zathura")
                                ("mkv" . "mpv")
                                ("webm" . "mpv")
                                ("mp4" . "mpv")
                                ("mp3" . "mpv")
                                ("flac" . "mpv")
                                ("xcf" . "gimp"))))

(use-package diredfl
  :ensure t
  :after dired
  :hook dired-mode)

(with-eval-after-load 'dired
  (evil-define-key 'normal dired-mode-map
    [mouse-1] 'dired-open-file
    (kbd "l") 'dired-open-file ; use dired-find-file if not using dired-open
    (kbd "h") 'dired-up-directory
    (kbd "q") 'kill-this-buffer
    (kbd "'") 'bookmark-jump))
