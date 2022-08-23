;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

;; Create a variable to indicate where emacs's configuration is installed
(setq EMACS_DIR "~/.emacs.d/")
;;(setq package-archives '(("melpa" . "http://melpa.org/packages/")
;;                         ("gnu" . "http://elpa.gnu.org/packages/")))

; Fetch the list of packages available 
; (unless package-archive-contents (package-refresh-contents))

; Install use-package
;; (setq package-list '(use-package))
;; (dolist (package package-list)
;;  (unless (package-installed-p package)
;;    (package-refresh-contents)
;;    (package-install package)))

;; All the settings and package installation is set in configuration.org
;;(org-babel-load-file "~/.emacs.d/emacs-configuration.org")
;; Add the load-path for init emacs
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-ui)
(require 'init-c)
;; (require 'init-rust)

;; Opening the init.el file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; Opening the init-ui.el file in "~/.emacs.d/lisp/" 
(defun open-init-file-init-ui ()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-ui.el"))
;; key binding for open-init-file() function
(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "<f3>") 'open-init-file-init-ui)

;; Hooking the 'emacs-startup-hook for performance when init emacs
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 300000000 ; 300mb	
          gc-cons-percentage 0.1)))

;; Avoid garbage collection at statup
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

;; Set it to big number(100mb)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb


;; --------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" "eca44f32ae038d7a50ce9c00693b8986f4ab625d5f2b4485e20f22c47f2634ae" "e0628ee6c594bc7a29bedc5c57f0f56f28c5b5deaa1bc60fc8bd4bb4106ebfda" default))
 '(font-use-system-font t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(rustic rust rust-mode dracula-theme helm-lsp helm-swoop helm-descbinds helm heaven-and-hell yasnippet-snippets yaml-mode which-key vertico use-package-chords simple-httpd quickrun projectile popup orderless lsp-ui lsp-java flycheck exec-path-from-shell company chocolate-theme async))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 180 :width normal)))))
