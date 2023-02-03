
;;big daddy setup, makes sure use-package is installed/used
;;makes emacs highly moveable between machines
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;;quelpa can load packages automatically
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

;;to be able to use use-package with the quelpa keyword
;; (quelpa
;;  '(quelpa-use-package
;;    :fetcher git
;;    :url "https://github.com/quelpa/quelpa-use-package.git"))
;; (require 'quelpa-use-package)


;;quick use-package doc
;; :init -> exprs pre package load
;; :config -> exprs post package load
;; :mode -> regex of files to load a mode for
;; :hook -> (a-mode . b-mode) expands to add-hook
;; :custom-face -> expands to set face attribute
 
;; A few more useful configurations...
(use-package emacs
  :init
  ;;following is for corfu
  ;;TAB cycle if only few candidates
  (setq completion-cycle-threshold 3)
  ;;enable indentation and completion using TAB
  (setq tab-always-indent 'complete)
  
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3e374bb5eb46eb59dbd92578cae54b16de138bc2e8a31a2451bf6fdb0f3fd81b" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" default))
 '(package-selected-packages
   '(visual-regexp esup lsp-mode flycheck-clang-analyzer web-mode quelpa-use-package quelpa eglot tide typescript-mode tree-sitter-langs tree-sitter dirvish gruvbox-theme tuareg which-key hy-Mode js2-mode company flycheck hy-mode sly svelte-mode yasnippet-snippets yasnippet php-mode vertico-posframe use-package))
 '(safe-local-variable-values '((git-commit-major-mode . git-commit-elisp-text-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Xah fly keys, modal editing++
 ;; (add-to-list 'load-path "~/.emacs.d/lisp/")
 ;; (require 'xah-fly-keys)
 ;; (xah-fly-keys-set-layout "qwerty")
 ;; ;;activate it
 ;; (xah-fly-keys 1)

;;include the config files
(add-to-list 'load-path "~/.emacs.d/configs/")

;; load individual files
(load "packages")   ;;load in packages, if too bg it gets its own file
(load "misc")       ;;misc for temporary testing
(load "functions")  ;;all custom functions
(load "settings")   ;;all settings
(load "remaps")     ;;key remaps (loaded last with reason)
(load "php-mode-autoloads") ;; php mode (activation in settings)

;;starts the server allowing us to use emacs clients and create multiple
;; connected editors
(server-start)
