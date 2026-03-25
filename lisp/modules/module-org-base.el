;;; module-org-base.el --- Core Org workflow -*- lexical-binding: t; -*-

;;; Commentary:
;; This module owns the reusable Org foundations: core defaults, agenda and
;; capture bindings, file locations, and Markdown export support.

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
  ;; Cosmetic list-marker composition is lightweight enough to keep with the
  ;; base Org experience rather than making it a separate toggle.
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
          (directory-files-recursively org-directory "\\.org$"))))

(use-package ox-md
  :ensure nil)

(provide 'module-org-base)
;;; module-org-base.el ends here
