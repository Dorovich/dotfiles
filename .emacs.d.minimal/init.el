(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(column-number-mode 1)

(setq make-backup-files nil)
(setq confirm-kill-emacs nil)
(setq visible-bell nil)
(setq comp-async-report-warnings-errors nil)
(setq load-prefer-newer noninteractive)

(set-face-attribute 'default nil :font "mononoki NF" :height 150)
(set-face-attribute 'fixed-pitch nil :font "mononoki NF" :height 150)
(set-face-attribute 'variable-pitch nil :font "mononoki NF" :height 150)

(load-theme 'wombat)
