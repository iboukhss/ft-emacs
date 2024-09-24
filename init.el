;; Initialization

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(add-to-list 'load-path (concat user-emacs-directory "ft-lisp"))
(require 'header)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Basic UI enhancements

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(width . 90))

;; Fonts and themes

(add-to-list 'default-frame-alist '(font . "JetBrains Mono NL-11"))
(set-face-attribute 'default t :font "JetBrains Mono NL-11")

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-gruvbox t)
  :custom (doom-themes-enable-italic nil))

;; Completion packages

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (style basic partial-completion)))))

(use-package corfu
  :ensure t
  :init (global-corfu-mode)
  :custom (corfu-auto t))

(use-package embark
  :ensure t
  :custom (prefix-help-command #'embark-prefix-help-command))

;; Global modes

(recentf-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(savehist-mode 1)
(delete-selection-mode 1)

(setq use-dialog-box nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Programming setup

(column-number-mode 1)
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(setq-default display-line-numbers-width 3)

(setq backward-delete-char-untabify-method 'hungry)

(setq c-default-style
      '((c-mode    . "linux")
	(java-mode . "java")
	(awk-mode  . "awk")
	(other     . "gnu")))

(defun ft-c-mode-hook ()
  (setq-local tab-width 4)
  (setq-local c-basic-offset 4)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (local-set-key (kbd "C-c h") 'header-insert)
  (eglot-ensure))

(add-hook 'c-mode-hook 'ft-c-mode-hook)
