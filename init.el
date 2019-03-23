;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    init.el                                            :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    by: thor <thor@42.fr>                           +#+  +:+       +#+        ;
;                                                  +#+#+#+#+#+   +#+           ;
;    Created: 2013/06/18 14:01:14 by thor               #+#    #+#             ;
;    Updated: 2019/03/23 15:14:56 by acarlson         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
; Load general features files
;; (setq config_files "/usr/share/emacs/site-lisp/")
;; (setq load-path (append (list nil config_files) load-path))

;; Load general features files
(setq load-path (append (list nil "~/.emacs.d/dump/") load-path))

(load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")

(autoload 'php-mode "php-mode" "Major mode for editing PHP code" t)
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

; Set default emacs configuration
(set-language-environment "UTF-8")
(setq-default font-lock-global-modes nil)
(setq-default line-number-mode nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(global-set-key (kbd "DEL") 'backward-delete-char)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
							64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; Load user configuration
;; (if (file-exists-p "~/.myemacs") (load-file "~/.myemacs"))



;******************************************************************************;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages
   (quote
	(fish-mode evil-tutor evil-numbers ruby-end ruby-extra-highlight ahk-mode molokai-theme opencl-mode glsl-mode elisp-lint flycheck-golangci-lint python-pylint pylint flycheck rust-playground rust-mode x-path-walker helm go-mode neotree all-the-icons auto-complete evil magit elpy)))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "purple4")))))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")
						 ("melpa" . "http://melpa.milkbox.net/packages/")))

;; (setq config_files "~/.emacs.d/lisp")
;; (setq load-path (append (list nil config_files) load-path))
(setq load-path (append (list nil "~/.emacs.d/lisp") load-path))

(require 'column-marker)
(require 'fill-column-indicator)
(require 'nlinum)
(require 'hl-todo)
(require 'lorem-ipsum)
(require 'xahk-mode)
(require 'escreen)
(escreen-install)

;; Turn on evil mode if it is installed
(when (require 'evil nil 'noerror)
  (evil-mode 1)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'neotree-mode 'emacs)
  (evil-set-initial-state 'help-mode 'emacs)

  (when (require 'evil-numbers nil 'noerror)
	(define-key evil-normal-state-map (kbd "C-c C-a") 'evil-numbers/inc-at-pt)
	(define-key evil-normal-state-map (kbd "C-c C-x") 'evil-numbers/dec-at-pt)
	))

;; Set auto-complete-mode settings if installed
(when (require 'auto-complete nil 'noerror)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (add-to-list 'ac-modes 'prog-mode)
  (add-to-list 'ac-modes 'makefile-bsdmake-mode)
  (add-to-list 'ac-modes 'makefile-gmake-mode))

;; Set neotree settings if installed
(when (require 'neotree nil 'noerror)
  (global-set-key [f8] 'neotree-toggle))

;; Set global undo tree
;; C-x u is amazing
(when (require 'undo-tree nil 'noerror)
  (global-undo-tree-mode))

;; Set global flycheck
(when (require 'flycheck nil 'noerror)
  (global-flycheck-mode))

;; Set file extensions for glsl
(when (require 'glsl-mode nil 'noerror)
  (autoload 'glsl-mode "glsl-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
  (add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
  (add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
  (add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
  )

(load "my-defaults.el")
(load "my-hotkeys.el")
(load "my-prog-config.el")
(load "my-c-config.el")
(load "my-c++-config.el")
(load "my-ruby-config.el")
(load "my-term-config.el")

;; Set modes
;; (add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-2 80)))
;; commented out in favor of fci-mode
(add-hook 'prog-mode-hook 'my-prog-config)
(add-hook 'c-mode-hook 'my-c-config)
(add-hook 'c++-mode-hook 'my-c++-config)
(add-hook 'ruby-mode-hook 'my-ruby-config)
(add-hook 'org-mode-hook 'font-lock-mode)
(add-hook 'term-mode-hook 'my-term-config)
