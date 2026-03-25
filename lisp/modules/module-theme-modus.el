;;; module-theme-modus.el --- Modus theme module -*- lexical-binding: t; -*-

;;; Commentary:
;; Keep all theme-specific behavior here so the rest of the config does not
;; need to know about Modus internals. This module owns the theme palette,
;; the text-scale shortcuts, and optional circadian switching.

;;; Code:

(use-package modus-themes
  :init
  (setq modus-themes-bold-constructs nil
        modus-themes-italic-constructs t
        modus-themes-mixed-fonts nil
        modus-themes-variable-pitch-ui nil
        modus-themes-mode-line '(accented borderless (padding . 4) (height . 0.9))
        modus-themes-markup '(background italic)
        modus-themes-syntax '(yellow-comments green-strings)
        modus-themes-hl-line '(underline accented)
        modus-themes-paren-match '(bold intense)
        modus-themes-links '(neutral-underline background)
        modus-themes-box-buttons '(variable-pitch flat faint 0.9)
        modus-themes-prompts nil
        modus-themes-completions nil
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
  :if (and crabs-enable-circadian
           crabs-calendar-latitude
           crabs-calendar-longitude)
  :config
  (setq calendar-latitude crabs-calendar-latitude
        calendar-longitude crabs-calendar-longitude
        circadian-themes '(("8:00" . modus-operandi)
                           ("16:00" . modus-vivendi)))
  (circadian-setup))

(provide 'module-theme-modus)
;;; module-theme-modus.el ends here
