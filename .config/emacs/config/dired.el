;; -*- lexical-binding: t -*-

(use-package dired
  :commands (dired-mode dired)
  :defer t
  :config
  (evil-define-key 'normal dired-mode-map
    (kbd "h") 'dired-up-directory
    (kbd "<left>") 'dired-up-directory
    (kbd "q") 'kill-this-buffer
    (kbd "'") 'bookmark-jump))

(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :hook dired-mode)

(use-package dired-open
  :ensure t
  :after dired
  :config
  (evil-define-key 'normal dired-mode-map
    [mouse-1] 'dired-open-file
    (kbd "l") 'dired-open-file
    (kbd "<right>") 'dired-open-file)
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("jpeg" . "sxiv")
                                ("png" . "sxiv")
                                ("webp" . "sxiv")
                                ("pdf" . "zathura")
                                ("cbz" . "zathura")
                                ("mkv" . "mpv")
                                ("webm" . "mpv")
                                ("mov" . "mpv")
                                ("mp4" . "mpv")
                                ("mp3" . "mpv")
                                ("flac" . "mpv")
                                ("xcf" . "gimp"))))

(use-package dired-narrow
  :ensure t
  :after dired
  :config
  (evil-define-key 'normal dired-mode-map
    (kbd "/") 'dired-narrow))

(use-package diredfl
  :ensure t
  :after dired
  :hook dired-mode)
