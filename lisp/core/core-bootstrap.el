;;; core-bootstrap.el --- Package bootstrap -*- lexical-binding: t; -*-

;;; Commentary:
;; Centralize package setup here so the rest of the config can assume
;; `use-package' is available. This keeps package installation policy in one
;; file instead of scattering archive and bootstrap decisions across modules.

;;; Code:

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(provide 'core-bootstrap)
;;; core-bootstrap.el ends here
