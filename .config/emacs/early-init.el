;; Initial gc values for faster startup.
;; Later gcmh will be enabled and it will configure these variables.
(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.6)

;; Do not load outdated byte code files.
(setq load-prefer-newer t)

;; Emacs "updates" its ui more often than it needs to, so we slow it down slightly from 0.5s
(setq idle-update-delay 1.0)

;; No need to keep duplicates in prompt history.
(setq history-delete-duplicates t)

;; Disable bidirectional text rendering for a modest performance boost.
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)

;; Reduce rendering/line scan work for Emacs by not rendering cursors or regions
;; in non-focused windows.
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Don't ping things that look like domain names.
(setq ffap-machine-p-known 'reject)

;; Resizing the Emacs frame can be a terribly expensive part of changing the font.
(setq frame-inhibit-implied-resize t)

;; Font compacting can be terribly expensive, especially for rendering icon
;; fonts on Windows. Whether it has a notable affect on Linux and Mac hasn't
;; been determined, but we inhibit it there anyway.
(setq inhibit-compacting-font-caches t)

;; Silence compiler warnings as they can be pretty disruptive
(setq comp-async-report-warnings-errors nil)
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))

;; Get rid of "For information about GNU Emacs..." message at startup,
;; unless we're in a daemon session
(unless (daemonp)
  (advice-add 'display-startup-echo-are-message :override 'ignore))

;; Disable second passing of auto-mode-alist
(setq auto-mode-case-fold nil)

;; Give some breathing room
(set-fringe-mode 0)

;; Default was too low; Increase for better lsp performance.
(setq read-process-output-max (* 3 1024 1024)) ;; 3mb

;; Workaround for https://debbugs.gnu.org/34341 in GNU Emacs <= 26.3.
(when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Use fundamental mode for starting buffer so to not load a lot of packages
(setq initial-major-mode 'fundamental-mode)

;; From https://irreal.org/blog/?p=8243
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Put Emacs auto-save and backup files to /tmp/ or C:/Temp/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))

;; Change autosave dir to tmp
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
      backup-directory-alist `((".*" . ,emacs-tmp-dir)))

;; Resizing the Emacs frame can be a terribly expensive part of changing the font.
(setq frame-inhibit-implied-resize t)

;; Don't want a mode line while loading init.
(setq mode-line-format nil)

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

;; No dialog boxes
(setq use-dialog-box nil)

;; No Alarms by default.
(setq ring-bell-function 'ignore)

;; Make *scratch* buffer blank
(setq initial-scratch-message nil)

;; No welcome screen, direcly to *scratch*
(setq inhibit-startup-screen t)

;; Fix transparency issues
(add-to-list 'default-frame-alist '(alpha . 100))

;; Enable this command, which is disabled for some reason
(put 'dired-find-alternate-file 'disabled nil)

;; Set frame size by pixels, not by character height
(setq frame-resize-pixelwise t)
