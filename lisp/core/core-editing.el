;;; core-editing.el --- Editing helpers -*- lexical-binding: t; -*-

;;; Commentary:
;; General editing behavior and helper commands.

;;; Code:

(when crabs-ispell-program
  (setq ispell-program-name crabs-ispell-program))

(defun crabs-replace-smart-quotes (beg end)
  "Replace smart quotes between BEG and END with ASCII quotes."
  (interactive "r")
  (format-replace-strings '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'"))
                          nil beg end))

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package ido
  :ensure nil
  :init
  (setq ido-enable-flex-matching t
        ido-everywhere t
        ido-use-filename-at-point 'guess
        ido-create-new-buffer 'always
        ido-file-extensions-order '(".org" ".txt" ".el"))
  :config
  (ido-mode 1))

(provide 'core-editing)
;;; core-editing.el ends here
