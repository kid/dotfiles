;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(toggle-frame-maximized)

(setq
 doom-font (font-spec :family "Hack Nerd Font Mono" :size 14)
 doom-theme 'doom-gruvbox
 display-line-numbers-type 'visual
 neo-window-fixed-size nil
 projectile-project-search-path '("~/Code/wave2" "~/Code/kid"))

(use-package! groovy-mode
  :config
  (add-to-list 'auto-mode-alist '("Jenkinsfile\\.w+" . groovy-mode)))

;; Might be needed for tiling?
(menu-bar-mode t)
