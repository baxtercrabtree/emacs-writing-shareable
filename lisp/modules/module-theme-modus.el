;;; module-theme-modus.el --- Modus theme module -*- lexical-binding: t; -*-

;;; Commentary:
;; Keep all theme-specific behavior here so the rest of the config does not
;; need to know about Modus internals. This module aims to stay small and
;; writing-focused: preserve the settings that visibly affect Org readability,
;; while avoiding a large copied sample of theme options.

;;; Code:

(use-package modus-themes
  :init
  ;; Keep the theme config small. These settings are the ones that most clearly
  ;; affect this writing-oriented setup.
  (setq modus-themes-italic-constructs t
        modus-themes-mode-line '(accented borderless (padding . 4) (height . 0.9))
        modus-themes-syntax '(yellow-comments green-strings)
        modus-themes-hl-line '(underline accented)
        modus-themes-paren-match '(bold intense)
        modus-themes-region '(bg-only no-extend)
        modus-themes-diffs 'desaturated
        modus-themes-org-blocks 'gray-background
        modus-themes-org-agenda '((header-block . (variable-pitch 1.3))
                                  (header-date . (grayscale workaholic bold-today 1.1))
                                  (event . (accented varied))
                                  (scheduled . uniform)
                                  (habit . traffic-light))
        modus-themes-headings '((1 . (overline background variable-pitch 1.3))
                                (2 . (rainbow overline 1.1))
                                (t . (semibold))))
  :config
  (load-theme 'modus-operandi t)
  (define-key global-map (kbd "<f1>") #'text-scale-decrease)
  (define-key global-map (kbd "<f2>") #'text-scale-increase)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

(use-package circadian
  :if (and ews-enable-circadian
           ews-calendar-latitude
           ews-calendar-longitude)
  :config
  (setq calendar-latitude ews-calendar-latitude
        calendar-longitude ews-calendar-longitude
        circadian-themes '(("8:00" . modus-operandi)
                           ("16:00" . modus-vivendi)))
  (circadian-setup))

(provide 'module-theme-modus)
;;; module-theme-modus.el ends here
