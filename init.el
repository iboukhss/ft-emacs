(menu-bar-mode -1)
(tool-bar-mode -1)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(setq warning-minimum-level :error)

(add-to-list 'load-path (concat user-emacs-directory "ft-lisp"))
(require 'header)
(global-set-key (kbd "C-c h") 'header-insert)
