;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    init.el                                            :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    by: thor <thor@42.fr>                           +#+  +:+       +#+        ;
;                                                  +#+#+#+#+#+   +#+           ;
;    Created: 2013/06/18 14:01:14 by thor               #+#    #+#             ;
;    Updated: 2018/12/08 12:43:58 by acarlson         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
; Load general features files
;; (setq config_files "/usr/share/emacs/site-lisp/")
;; (setq load-path (append (list nil config_files) load-path))

;; Load general features files
(setq config_files "~/.emacs.d/dump/")
(setq load-path (append (list nil config_files) load-path))

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



;*******************************************************************************;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq config_files "~/.emacs.d/srcs")
(setq load-path (append (list nil config_files) load-path))

(require 'column-marker)
(require 'lorem-ipsum)
(require 'escreen)
(require 'evil)
(evil-mode 1)

(load "move_text.el")
(load "backup_redirect.el")
(load "window_movement.el")
(load "highlighting.el")
(load "my_c_config.el")
(load "my_prog_config.el")

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Theme
(load-theme 'manoj-dark t)

;; Line numbers
(global-linum-mode 1)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable scroll bar in GUI
(if (window-system)
	(scroll-bar-mode -1)
  )

;; Set line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Change panes in GUI
(global-set-key (kbd "s-[") 'back-window)
(global-set-key (kbd "s-]") 'other-window)

;; Escreen hotkeys
(add-hook 'escreen-goto-screen-hook
		  'escreen-enable-number-mode-if-more-than-one-screen)
(global-set-key (kbd "M-0") 'escreen-goto-screen-0)
(global-set-key (kbd "M-1") 'escreen-goto-screen-1)
(global-set-key (kbd "M-2") 'escreen-goto-screen-2)
(global-set-key (kbd "M-3") 'escreen-goto-screen-3)
(global-set-key (kbd "M-4") 'escreen-goto-screen-4)
(global-set-key (kbd "M-5") 'escreen-goto-screen-5)
(global-set-key (kbd "M-6") 'escreen-goto-screen-6)
(global-set-key (kbd "M-7") 'escreen-goto-screen-7)
(global-set-key (kbd "M-8") 'escreen-goto-screen-8)
(global-set-key (kbd "M-9") 'escreen-goto-screen-9)
(global-set-key (kbd "C->") 'escreen-goto-next-screen)
(global-set-key (kbd "C-<") 'escreen-goto-prev-screen)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages (quote (magit evil elpy auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; auto-complete-mode settings
(ac-config-default)
(setq ac-use-menu-map t)
(add-to-list 'ac-modes 'prog-mode)

;; Set modes
(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-2 80)))
(add-hook 'prog-mode-hook 'my_prog_config)
(add-hook 'c-mode-hook 'my_c_config)
(add-hook 'org-mode-hook 'font-lock-mode)
