
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-frame-font "Geist Mono 14" nil t)

;; (require 'package)
;; (add-to-list 'package-archives
;; 	     '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize)
;; (package-refresh-contents)
;; 
;; (unless (package-installed-p 'evil)
;;   (package-install 'evil))
;; (unless (package-installed-p 'mindre-theme)
;;   (package-install 'mindre-theme))
;; 
;; (unless (package-installed-p 'mindre-theme)
;;   (package-install 'mindre-threme))

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(require 'mindre-theme)
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(mindre))
 '(custom-safe-themes
   '("f60404efc40b646a6a742d833c7097f9225550288565f945ec990d343c1a22ff" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages '(mindre-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)
