;;; module-org-writing.el --- Optional Org writing workflow -*- lexical-binding: t; -*-

;;; Commentary:
;; Writing-focused extras layered on top of `module-org-base'. This module owns
;; presentation tweaks, centered writing mode, word counts, and journal access.

;;; Code:

(require 'module-org-base)

(use-package org
  :ensure nil
  :config
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'crabs-org-writing-mode-hook))

(use-package org-journal
  :after org
  :bind (("C-c C-j" . org-journal-new-entry))
  :init
  (setq org-journal-date-format "%A, %d %B %Y")
  :config
  (when (crabs-file-in-directory-p crabs-org-journal-directory)
    (setq org-journal-dir (expand-file-name crabs-org-journal-directory))))

(use-package wc-mode
  :commands wc-mode)

(use-package olivetti
  :commands olivetti-mode)

(defun crabs-org-writing-mode-hook ()
  "Apply writing-friendly defaults in Org buffers."
  (when (eq major-mode 'org-mode)
    (when (fboundp 'fringe-mode)
      (fringe-mode 0))
    (variable-pitch-mode 1)
    (when (fboundp 'wc-mode)
      (wc-mode))
    (when (fboundp 'olivetti-mode)
      (setq-local olivetti-body-width crabs-writing-body-width)
      (olivetti-mode 1))
    (when (and crabs-writing-cursor-color (display-graphic-p))
      (set-cursor-color crabs-writing-cursor-color))))

(provide 'module-org-writing)
;;; module-org-writing.el ends here
