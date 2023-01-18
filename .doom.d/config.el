;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(alpha . 100))

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Vidoski"
      user-mail-address "youwillneverknow")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
(setq doom-font (font-spec :family "mononoki NF" :size 17)
      doom-variable-pitch-font (font-spec :family "mononoki NF" :size 17))
;;(setq doom-font (font-spec :family "Roboto Mono" :size 17)
;;      doom-variable-pitch-font (font-spec :family "Roboto Mono" :size 17))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(require 'iso-transl)

(setq fancy-splash-image (concat doom-user-dir "splashes/splash_3.png")
      default-input-method "catalan-prefix"
      shell-file-name "/bin/bash")

;; Lo que se muestra en la pantalla de inicio
(setq +doom-dashboard-functions
  '(doom-dashboard-widget-banner
    ;;doom-dashboard-widget-shortmenu
    doom-dashboard-widget-loaded))

;;(global-hide-mode-line-mode)

(after! evil
        (setq evil-normal-state-cursor '(box "light yellow")
              evil-insert-state-cursor '(bar "light yellow")
              evil-visual-state-cursor '(hollow-rectangle "light yellow"))

        (evil-define-key 'normal 'global
          (kbd "ñ") 'evil-ex
          (kbd "Ñ") 'execute-extended-command
          (kbd "U") 'evil-redo
          (kbd "H") 'evil-beginning-of-line
          (kbd "L") 'evil-end-of-line
          (kbd "C-h") 'evil-window-left
          (kbd "C-j") 'evil-window-down
          (kbd "C-k") 'evil-window-up
          (kbd "C-l") 'evil-window-right)

        (evil-define-key 'visual 'global
          (kbd "H") 'evil-beginning-of-line
          (kbd "L") 'evil-end-of-line))

(after! org
        (setq org-superstar-headline-bullets-list '("◉" "●" "✱" "◆" "✸" "●" "✱" "◆" "✸")
                org-superstar-item-bullet-alist '((?+ . ?➤) (?- . ?☛)))

        (defun vido/org-colors-tomorrow-night ()
        "Enable Tomorrow Night colors for Org headers."
        (interactive)
        (dolist
        (face
                '((org-level-1 1.3 "#81a2be" ultra-bold)
                (org-level-2 1.15 "#b294bb" extra-bold)
                (org-level-3 1.07 "#b5bd68" bold)
                (org-level-4 1.04 "#e6c547" semi-bold)
                (org-level-5 1.02 "#cc6666" normal)
                (org-level-6 1.01 "#70c0ba" normal)
                (org-level-7 1.005 "#b77ee0" normal)
                (org-level-8 1.003 "#9ec400" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

        ;; Load our desired vido/org-colors-* theme on startup
        (vido/org-colors-tomorrow-night))
