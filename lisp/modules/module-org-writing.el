;;; module-org-writing.el --- Optional Org writing workflow -*- lexical-binding: t; -*-

;;; Commentary:
;; Writing-focused Org configuration with safe defaults.

;;; Code:

(use-package org
  :ensure nil
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :init
  (setq org-hide-emphasis-markers crabs-org-hide-emphasis-markers
        org-log-done t
        org-startup-folded crabs-org-startup-folded
        org-emphasis-alist '(("*" bold)
                             ("/" italic)
                             ("_" underline)
                             ("=" verbatim)
                             ("~" code)
                             ("+" strike-through)))
  :config
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'crabs-org-writing-mode-hook)
  (font-lock-add-keywords
   'org-mode
   '(("^ *\\([-]\\) "
      (0 (prog1 ()
           (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (when (crabs-file-in-directory-p crabs-org-directory)
    (setq org-directory (expand-file-name crabs-org-directory)
          org-default-notes-file
          (expand-file-name crabs-default-notes-file org-directory)
          org-agenda-files
          (directory-files-recursively org-directory "\\.org$")))
  (when (crabs-file-in-directory-p crabs-org-journal-directory)
    (setq org-journal-dir (expand-file-name crabs-org-journal-directory))))

(use-package ox-md
  :ensure nil)

(use-package org-journal
  :after org
  :bind (("C-c C-j" . org-journal-new-entry))
  :init
  (setq org-journal-date-format "%A, %d %B %Y"))

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
