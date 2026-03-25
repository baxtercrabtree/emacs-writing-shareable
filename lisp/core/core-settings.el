;;; core-settings.el --- User-facing settings -*- lexical-binding: t; -*-

;;; Commentary:
;; Shared defaults plus overridable local settings.

;;; Code:

(defgroup crabs nil
  "Shareable Emacs configuration."
  :group 'convenience)

(defcustom crabs-enabled-modules '(theme-modus)
  "Modules enabled at startup."
  :type '(repeat symbol)
  :group 'crabs)

(defcustom crabs-org-directory nil
  "Root Org directory used by the optional writing module."
  :type '(choice (const :tag "Unset" nil) directory)
  :group 'crabs)

(defcustom crabs-org-journal-directory nil
  "Journal directory used by the optional writing module."
  :type '(choice (const :tag "Unset" nil) directory)
  :group 'crabs)

(defcustom crabs-default-notes-file "seeds/capture.org"
  "Default notes file relative to `crabs-org-directory'."
  :type 'string
  :group 'crabs)

(defcustom crabs-default-fixed-font nil
  "Preferred fixed pitch font family name."
  :type '(choice (const :tag "Unset" nil) string)
  :group 'crabs)

(defcustom crabs-default-variable-font nil
  "Preferred variable pitch font family name."
  :type '(choice (const :tag "Unset" nil) string)
  :group 'crabs)

(defcustom crabs-enable-circadian nil
  "Enable circadian theme switching when non-nil."
  :type 'boolean
  :group 'crabs)

(defcustom crabs-calendar-latitude nil
  "Latitude used by circadian."
  :type '(choice (const :tag "Unset" nil) number)
  :group 'crabs)

(defcustom crabs-calendar-longitude nil
  "Longitude used by circadian."
  :type '(choice (const :tag "Unset" nil) number)
  :group 'crabs)

(defcustom crabs-ispell-program
  (or (executable-find "ispell")
      (executable-find "aspell")
      (executable-find "hunspell"))
  "Spell-check executable path."
  :type '(choice (const :tag "Unset" nil) file)
  :group 'crabs)

(defcustom crabs-org-hide-emphasis-markers t
  "Whether Org should hide emphasis markers."
  :type 'boolean
  :group 'crabs)

(defcustom crabs-org-startup-folded 'content
  "Default folding behavior for Org buffers."
  :type '(choice symbol string)
  :group 'crabs)

(defcustom crabs-writing-body-width 80
  "Preferred body width for the writing module."
  :type 'integer
  :group 'crabs)

(defcustom crabs-writing-cursor-color nil
  "Optional cursor color for the writing module."
  :type '(choice (const :tag "Unset" nil) string)
  :group 'crabs)

(let ((local-init (expand-file-name "local/init.el" crabs-config-root)))
  (when (file-exists-p local-init)
    (load local-init nil 'nomessage)))

(provide 'core-settings)
;;; core-settings.el ends here
