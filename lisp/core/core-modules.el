;;; core-modules.el --- Module loader -*- lexical-binding: t; -*-

;;; Commentary:
;; Optional features are enabled by name from `ews-enabled-modules'.
;; This lets the shared config stay small while still supporting add-on
;; behavior such as core Org support or the fuller writing workflow.

;;; Code:

(defconst ews-module-alist
  '((theme-modus . module-theme-modus)
    (org-base . module-org-base)
    (org-writing . module-org-writing))
  "Mapping from module keyword to feature symbol.")

(dolist (module ews-enabled-modules)
  (let ((feature (alist-get module ews-module-alist)))
    (if feature
        (require feature)
      (message "Unknown module skipped: %S" module))))

(provide 'core-modules)
;;; core-modules ends here
