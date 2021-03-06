(require 'package)


(global-auto-revert-mode 1)
(setq auto-save-default nil)
(setq search-default-mode 'nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backnup")))
(package-initialize)
;; packages!
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))


;; PYTHON!!
;; pip install jedi flake8 importmagic autopep8

(use-package elpy
  :ensure t
  :config (elpy-enable)
  )

(use-package google-this
  :ensure t
  :config
  (global-set-key (kbd "C-c g") 'google-this)
  )
  

(use-package polymode
  :ensure t
  :config
  (require 'poly-R)
  ;;; MARKDOWN
  (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
  (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
  (require 'poly-markdown))
(use-package ess
  :ensure t)


(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map (kbd "C-n") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-p") 'ivy-previous-line)
  (define-key ivy-minibuffer-map (kbd "C-f") 'ivy-insert-current)
  (define-key ivy-minibuffer-map (kbd "C-h") 'ivy-immediate-done)
  
  )
(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c C-y") 'counsel-yank-pop )
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  :ensure t
  )

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay .01)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (add-hook 'eshell-mode-hook
	    '(lambda () (company-mode -1)))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "<return>") nil)
    (define-key company-active-map (kbd "RET") nil)
    )
  (define-key company-active-map (kbd "TAB") 'company-complete)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n")
    'company-select-next)
  (define-key company-active-map (kbd "C-p")
    'company-select-previous)
  (global-set-key (kbd "C-l") 'company-manual-begin)
  (define-key company-active-map (kbd "C-e")
    'yas-expand
    )
  :ensure t)


(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-default-dark t)
  )

(global-set-key (kbd "M-r") 'query-replace)

(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  :ensure t)

;; no bars
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (polymode web-mode w3m use-package tabbar solarized-theme neotree monokai-theme memoize markdown-preview-mode markdown-mode+ javadoc-lookup google-this flycheck evil-surround evil-org evil-mc evil-magit ess elpy editorconfig counsel-projectile base16-theme avy atom-one-dark-theme ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
