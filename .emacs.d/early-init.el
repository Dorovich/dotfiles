;; https://github.com/hlissner/doom-emacs/blob/58af4aef56469f3f495129b4e7d947553f420fca/core/core.el#L323
(setq frame-inhibit-implied-resize t)

;; https://github.com/hlissner/doom-emacs/blob/58af4aef56469f3f495129b4e7d947553f420fca/core/core.el#L331
(setq inhibit-compacting-font-caches t)

;; https://github.com/hlissner/doom-emacs/blob/58af4aef56469f3f495129b4e7d947553f420fca/core/core.el#L205
(setq idle-update-delay 1.0)

;; Don't want a mode line while loading init.
;(setq mode-line-format nil)

;; No scrollbar by default.
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; No nenubar by default.
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; No toolbar by default.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; No tooltip by default.
(when (fboundp 'tooltip-mode)
  (tooltip-mode -1))

;; No Alarms by default.
(setq ring-bell-function 'ignore)

;; Make *scratch* buffer blank
(setq initial-scratch-message nil)

;; No welcome screen, direcly to *scratch*
(setq inhibit-startup-screen t)

;; Fix transparency issues
(add-to-list 'default-frame-alist '(alpha . 100))
