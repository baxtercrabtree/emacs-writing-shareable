;;; init.el --- Shareable Emacs configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; This is the only file Emacs needs to find at startup.
;; Its job is intentionally small: establish the config root, put the core
;; and module directories on `load-path', then load the shared startup layers
;; in a predictable order.
;;
;; Load order:
;; 1. `core-bootstrap' installs package management conventions.
;; 2. `core-settings' loads user-facing defaults and `local/init.el'.
;; 3. `core-os', `core-defaults', `core-ui', and `core-editing' apply shared
;;    behavior for all sessions.
;; 4. `core-modules' loads optional features such as themes or Org writing.

;;; Code:

(defconst ews-config-root
  (file-name-directory (or load-file-name buffer-file-name))
  "Root directory of this Emacs configuration.")

(add-to-list 'load-path (expand-file-name "lisp/core" ews-config-root))
(add-to-list 'load-path (expand-file-name "lisp/modules" ews-config-root))

(require 'core-bootstrap)
(require 'core-settings)
(require 'core-os)
(require 'core-defaults)
(require 'core-ui)
(require 'core-editing)
(require 'core-modules)

(provide 'init)
;;; init.el ends here
