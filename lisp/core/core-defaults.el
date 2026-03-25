;;; core-defaults.el --- Shared defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Sensible defaults and local state paths.

;;; Code:

(setq custom-file (expand-file-name "local/custom.el" crabs-config-root))
(load custom-file 'noerror)

(let ((backup-dir (expand-file-name "var/backup/" crabs-config-root))
      (autosave-dir (expand-file-name "var/auto-save/" crabs-config-root)))
  (make-directory backup-dir t)
  (make-directory autosave-dir t)
  (setq backup-directory-alist `((".*" . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,autosave-dir t))
        auto-save-list-file-prefix (expand-file-name ".saves-" autosave-dir)))

(setq scroll-step 3)
(setq show-paren-style 'expression)
(setq ring-bell-function 'ignore)

(show-paren-mode 1)
(global-hl-line-mode 1)
(display-time-mode 1)

(provide 'core-defaults)
;;; core-defaults.el ends here
