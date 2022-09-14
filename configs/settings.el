;;disable menu bar and tool bar
(tool-bar-mode -1)
;;(menu-bar-mode -1)

;;enable indentation in org mode automatically
(add-hook 'org-mode-hook 'org-indent-mode)

;; enable php mode
(when (file-directory-p "~/.emacs.d/configs/")
  (load "~/.emacs.d/configs/php-mode-autoloads.el"))

;; set backup directory such that backup files (...~) don't pile everywhere
(setq backup-directory-alist '(("." . "~/.file_backups")))
