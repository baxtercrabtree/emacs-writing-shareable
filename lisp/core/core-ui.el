;;; core-ui.el --- UI defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Frame, font, and appearance defaults.

;;; Code:

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode 1))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))
        (:eval (if (buffer-modified-p) " *" ""))
        " - Emacs"))

(when (display-graphic-p)
  (when (crabs-font-installed-p crabs-default-fixed-font)
    (set-face-attribute 'default nil :family crabs-default-fixed-font)
    (set-face-attribute 'fixed-pitch nil :family crabs-default-fixed-font :height 1.0))
  (when (crabs-font-installed-p crabs-default-variable-font)
    (set-face-attribute 'variable-pitch nil :family crabs-default-variable-font :height 1.0)))

(provide 'core-ui)
;;; core-ui.el ends here
