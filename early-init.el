;;; early-init.el --- Early startup tweaks -*- lexical-binding: t; -*-

;;; Commentary:
;; Keep package activation under explicit control.

;;; Code:

(setq package-enable-at-startup nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(provide 'early-init)
;;; early-init.el ends here
