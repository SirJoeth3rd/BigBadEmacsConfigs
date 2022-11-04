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

(use-package tuareg
  :mode ("\\.ml?\\'" . tuareg-mode))

;;dirvish, basically dired++
;;(use-package dirvish
;;  :config
;;  (dirvish-override-dired-mode))
