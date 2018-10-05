(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; (prelude-require-packages '(evil-escape linum-relative use-package))
(prelude-require-packages '(evil-escape linum-relative use-package))

(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jh")

;; (define-key evil-normal-state-map (kbd "TAB") 'evil-buffer)
;; (define-key evil-normal-state-map "s" nil)
;; (define-key evil-normal-state-map (kbd "s s") 'avy-goto-char)
;; (define-key evil-normal-state-map (kbd "s k") 'avy-goto-line-above)
;; (define-key evil-normal-state-map (kbd "s j") 'avy-goto-line-below)
;; (define-key evil-normal-state-map (kbd "s b") 'avy-goto-word-0-above)
;; (define-key evil-normal-state-map (kbd "s w") 'avy-goto-word-0-below)

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            paredit        ; Introduce some paredit commands.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))
