;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  ;; vertico cycling
  (setq vertico-cycle t)
  )

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
  :mode ("\\.svelte?\\'" . svelte-mode))

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

;;the beter js-mode
(use-package js2-mode
  :mode ("\\.js?\\'" . js2-mode))

;;auto completion
;; (use-package company
;;   :ensure t
;;   :init (add-hook 'after-init-hook 'global-company-mode))

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

;;used for ocaml dev
(use-package tuareg
  :mode ("\\.ml?\\'" . tuareg-mode))

;;just the color theme
(use-package gruvbox-theme
  :config (load-theme 'gruvbox-light-medium))

;;dirvish, basically dired++
(use-package dirvish
  :config
  (dirvish-override-dired-mode))

;;
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

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

;;my play with tree sitter
;;(use-package tree-sitter
;;  :ensure t
;;  :config
;;  (global-tree-sitter-mode)
;;  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
;;support for a bunch of langauges
;;(use-package tree-sitter-langs
;;  :ensure t
;;  :after tree-sitter)
