;;; core-settings.el --- User-facing settings -*- lexical-binding: t; -*-

;;; Commentary:
;; Shared defaults plus overridable local settings.

;;; Code:

(defgroup ews nil
  "Shareable Emacs configuration."
  :group 'convenience)

(defcustom ews-enabled-modules '(theme-modus)
  "Modules enabled at startup."
  :type '(repeat symbol)
  :group 'ews)

(defcustom ews-org-directory nil
  "Root Org directory used by the optional writing module."
  :type '(choice (const :tag "Unset" nil) directory)
  :group 'ews)

(defcustom ews-org-journal-directory nil
  "Journal directory used by the optional writing module."
  :type '(choice (const :tag "Unset" nil) directory)
  :group 'ews)

(defcustom ews-default-notes-file "seeds/capture.org"
  "Default notes file relative to `ews-org-directory'."
  :type 'string
  :group 'ews)

(defcustom ews-default-fixed-font nil
  "Preferred fixed pitch font family name."
  :type '(choice (const :tag "Unset" nil) string)
  :group 'ews)

(defcustom ews-default-variable-font nil
  "Preferred variable pitch font family name."
  :type '(choice (const :tag "Unset" nil) string)
  :group 'ews)

(defcustom ews-enable-circadian nil
  "Enable circadian theme switching when non-nil."
  :type 'boolean
  :group 'ews)

(defcustom ews-calendar-latitude nil
  "Latitude used by circadian."
  :type '(choice (const :tag "Unset" nil) number)
  :group 'ews)

(defcustom ews-calendar-longitude nil
  "Longitude used by circadian."
  :type '(choice (const :tag "Unset" nil) number)
  :group 'ews)

(defcustom ews-ispell-program
  (or (executable-find "ispell")
      (executable-find "aspell")
      (executable-find "hunspell"))
  "Spell-check executable path."
  :type '(choice (const :tag "Unset" nil) file)
  :group 'ews)

(defcustom ews-org-hide-emphasis-markers t
  "Whether Org should hide emphasis markers."
  :type 'boolean
  :group 'ews)

(defcustom ews-org-startup-folded 'content
  "Default folding behavior for Org buffers."
  :type '(choice symbol string)
  :group 'ews)

(defcustom ews-writing-body-width 80
  "Preferred body width for the writing module."
  :type 'integer
  :group 'ews)

(defcustom ews-writing-cursor-color nil
  "Optional cursor color for the writing module."
  :type '(choice (const :tag "Unset" nil) string)
  :group 'ews)

(let ((local-init (expand-file-name "local/init.el" ews-config-root)))
  (when (file-exists-p local-init)
    (load local-init nil 'nomessage)))

(provide 'core-settings)
;;; core-settings.el ends here
