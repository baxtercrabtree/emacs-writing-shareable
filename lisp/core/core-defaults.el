;;; core-defaults.el --- Shared defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Baseline defaults that are safe across the whole config, plus local state
;; paths for files Emacs generates while running.

;;; Code:

(setq custom-file (expand-file-name "local/custom.el" ews-config-root))
(load custom-file 'noerror)

(let ((backup-dir (expand-file-name "var/backup/" ews-config-root))
      (autosave-dir (expand-file-name "var/auto-save/" ews-config-root)))
  (make-directory backup-dir t)
  (make-directory autosave-dir t)
  (setq backup-directory-alist `((".*" . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,autosave-dir t))
        auto-save-list-file-prefix (expand-file-name ".saves-" autosave-dir)))

;; This is arguably a baseline editor default rather than a UI preference, so
;; it stays here for now. If the core file boundaries evolve, this is a likely
;; candidate to move into a more specific layer later.
(setq scroll-step 3)
(setq show-paren-style 'expression)
(setq ring-bell-function 'ignore)

(show-paren-mode 1)

(provide 'core-defaults)
;;; core-defaults.el ends here
