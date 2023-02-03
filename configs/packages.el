;;TODO make all my modes eglot centric

;;the search and replace you deserve
(use-package visual-regexp
  :ensure t)

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  ;; vertico cycling
  (setq vertico-cycle t))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;;yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(use-package yasnippet
  :config (yas-global-mode 1))

;;svelte mode
(use-package svelte-mode
  :mode ("\\.svelte?\\'" . svelte-mode)
  :hook (eglot))

;;Highlight matching paren
(use-package paren
  :ensure nil
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

;;syntax checker
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

;;c/c++ static analysis
(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))

;;the beter js-mode
(use-package js2-mode
  :mode ("\\.js?\\'" . js2-mode))

;;god-mode
(use-package god-mode
  :config
  (god-mode)
  (setq god-exempt-major-modes nil)
  (setq god-exempt-predicates nil)
  (defun my-god-mode-update-cursor-type ()
    (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))
  (add-hook 'post-command-hook #'my-god-mode-update-cursor-type)
  (god-mode))

;;shows minibuffer with all available key combinations
(use-package which-key
  :config (which-key-mode))

;;ocaml developement packages start here
(use-package tuareg
  :mode ("\\.ml?\\'" . tuareg-mode)
  :hook (tuareg-mode . eglot-ensure))

;;just the color theme
(use-package gruvbox-theme
  :config (load-theme 'gruvbox-light-medium))

;;dirvish, basically dired++
(use-package dirvish
  :config
  (dirvish-override-dired-mode))

;;for popping up autocompletions
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0))

;;for working with typescript
(use-package typescript-mode
  :mode ("\\.ts?\\'" . typescript-mode))
(use-package tide
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1))
  
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

;;web mode for webshit TODO -> need to activate automatically for modes
(use-package web-mode)

;;eglot bro it's eglot
(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
	       '(svelte-mode . ("svelteserver" "--stdio"))))

;;esup is a performance profiler
(use-package esup
  :ensure t)
(setq esup-depth 0) ;;fixes esup bug
