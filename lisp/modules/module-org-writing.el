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
  (add-hook 'org-mode-hook #'ews-org-writing-setup))

(defun ews-org-writing-journal-directory ()
  "Return the best journal directory for the writing workflow.

Prefer `ews-org-journal-directory' when it exists. Otherwise derive a
`journal' directory from `ews-org-directory' so journal entries stay anchored
to the current Org root instead of falling back to package defaults."
  (cond
   ((ews--directory-exists-p ews-org-journal-directory)
    (expand-file-name ews-org-journal-directory))
   ((ews--directory-exists-p ews-org-directory)
    (expand-file-name "journal" (expand-file-name ews-org-directory)))))

(use-package org-journal
  :after org
  :bind (("C-c C-j" . org-journal-new-entry))
  :init
  (setq org-journal-date-format "%A, %d %B %Y")
  :config
  (when-let ((journal-dir (ews-org-writing-journal-directory)))
    (unless (file-directory-p journal-dir)
      (make-directory journal-dir t))
    (setq org-journal-dir journal-dir)))

(use-package wc-mode
  :commands wc-mode)

(use-package olivetti
  :commands olivetti-mode)

(defun ews-org-writing-setup ()
  "Apply writing-friendly defaults in Org buffers."
  (when (eq major-mode 'org-mode)
    (when (fboundp 'fringe-mode)
      (fringe-mode 0))
    (variable-pitch-mode 1)
    (when (fboundp 'wc-mode)
      (wc-mode))
    (when (fboundp 'olivetti-mode)
      (setq-local olivetti-body-width ews-writing-body-width)
      (olivetti-mode 1))
    (when (and ews-writing-cursor-color (display-graphic-p))
      (set-cursor-color ews-writing-cursor-color))))

(provide 'module-org-writing)
;;; module-org-writing.el ends here
