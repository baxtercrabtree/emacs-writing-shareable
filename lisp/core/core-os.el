;;; core-os.el --- OS helpers -*- lexical-binding: t; -*-

;;; Commentary:
;; Small compatibility helpers kept in one place.

;;; Code:

(defun crabs-font-installed-p (font-name)
  "Return non-nil when FONT-NAME is available."
  (and font-name (member font-name (font-family-list))))

(defun crabs-file-in-directory-p (path)
  "Return non-nil when PATH exists and is a directory."
  (and path (file-directory-p path)))

(provide 'core-os)
;;; core-os.el ends here
