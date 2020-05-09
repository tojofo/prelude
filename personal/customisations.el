;; (setq prelude-guru nil)

;; My favourite coding font
;; (set-frame-font "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-frame-font "Monoid")
(set-frame-font "Bitstream Vera Sans Mono")

;; ;; Show line numbers in margin
(global-linum-mode 1)

;; ;; Map the alt/option key to meta
;; (setq mac-option-modifier 'meta)

;; ;; Default tabs to 4 spaces
;; (setq tab-width 4)

;; ;; Except in web mode
;; (add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))
;; (add-hook 'web-mode-hook (lambda () (setq web-mode-code-indent-offset 2)))
;; ;; (add-hook 'web-mode-hook 'prettier-js-mode)

;; ;; JavaScript mode
;; (add-hook 'javascript-mode-hook (lambda () (setq js2-basic-offset 2)))
;; (add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
;; (add-hook 'js2-mode-hook 'prettier-js-mode)

;; ;; SQL Mode
;; (add-hook 'sql-mode-hook (lambda () (setq tab-width 2)))

;; Enable web-mode for handlebars files
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))

;; Enable web-mode for ERB files
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

;; ;; Enable ruby-mode for common ruby file
;; (add-to-list 'auto-mode-alist '("\\.\\(rb\\|ru\\|builder\\|rake\\|thor\\|gemspec\\)\\'" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; ;; Enable json-mode for terraform files
(add-to-list 'auto-mode-alist '("\\.tf$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tfstate$" . json-mode))

;; ;; Split windows horizontally be default
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

;; ;; Use case sensitive abbreviations
;; (setq company-dabbrev-downcase nil)

;; Set a key binding for the silver searcher
(global-set-key (kbd "C-x C-a") 'ag)

;; Set a key binding for replace-string
(global-set-key (kbd "C-x C-g") 'replace-string)

;; Map C-w to backward kill word as in bash
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; ;; Search in all buffers visiting a file
(global-set-key (kbd "C-x x") 'multi-occur-in-matching-buffers)

;; ;; Unbind pesky sleep button which crashes emacs
;; (global-unset-key [(control z)])

;; Projectile key bindings
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-ag)

;; Helm settings
(define-key helm-map (kbd "<left>") 'helm-previous-source)
(define-key helm-map (kbd "<right>") 'helm-next-source)
;; for helm-find-files
(customize-set-variable 'helm-ff-lynx-style-map t)
;; for helm-imenu
(customize-set-variable 'helm-imenu-lynx-style-map t)
;; for semantic
(customize-set-variable 'helm-semantic-lynx-style-map t)
;; for helm-occur
(customize-set-variable 'helm-occur-use-ioccur-style-keys t)
;; for helm-grep
(customize-set-variable 'helm-grep-use-ioccur-style-keys t)

;; ;; Multiple cursors
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ;; Some magit stuff
;; (setq magit-last-seen-setup-instructions "1.4.0")
;; (setq magit-auto-revert-mode nil)

;; ;; Themes
(load-theme 'espresso t)

(defun mark-line-or-next ()
  "Marks the current line or extends the mark if there is no current selection"
  (interactive)
  (if mark-active
      (forward-line)
    (progn
      (beginning-of-line)
      (push-mark (point))
      (end-of-line)
      (forward-char)
      (activate-mark))))

(global-set-key (kbd "C-;") 'mark-line-or-next)

(defun mark-line-or-prev ()
  "Marks the current line or extends the mark if there is no current selection"
  (interactive)
  (if mark-active
      (previous-line)
    (progn
      (end-of-line)
      (push-mark (point))
      (beginning-of-line)
      (activate-mark))))

(global-set-key (kbd "C-M-;") 'mark-line-or-prev)

(provide 'customisations)
;;; customisations.el ends here
