;; This for setting emacs UI

;; Hide the menu-bar
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Set line number
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Set font
(when (member "monospace" (font-family-list))
  (set-frame-font "monospace" t t))
(when (member "monospace" (font-family-list))
  (set-frame-font "monospace-14" t t))
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(use-package dracula-theme
  :ensure t
  :init
  (load-theme 'dracula t))


;; Set language environment to UTF-8
;;(set-language-environment "UTF-8")
;;;(set-default-coding-systems 'utf-8)

;; Set theme
;;(use-package chocolate-theme
;;  :ensure t
;;  :config
;;  (load-theme 'chocolate t))
(provide 'init-ui)
