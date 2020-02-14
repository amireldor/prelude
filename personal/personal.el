(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(prelude-require-packages '(linum-relative use-package))

(define-key evil-normal-state-map (kbd "TAB") 'evil-buffer)
(define-key evil-normal-state-map "s" nil)
(define-key evil-normal-state-map (kbd "s s") 'avy-goto-char)
(define-key evil-normal-state-map (kbd "s k") 'avy-goto-line-above)
(define-key evil-normal-state-map (kbd "s j") 'avy-goto-line-below)
(define-key evil-normal-state-map (kbd "s b") 'avy-goto-word-0-above)
(define-key evil-normal-state-map (kbd "s w") 'avy-goto-word-0-below)

(defun find-prelude-personal ()
  (interactive)
  (find-file "~/.emacs.d/personal/personal.el"))


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
    (add-hook 'clojurescript-mode-hook #'parinfer-mode)
    (add-hook 'clojurec-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

(use-package evil-leader
  :ensure t
  :init
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "b" 'switch-to-buffer
      "w" 'save-buffer
      "q" 'kill-buffer-and-window
      "f" 'projectile--find-file
      "5" 'find-prelude-personal)
    (dolist (mode '(clojure-mode clojurescript-mode clojurec-mode))
      (evil-leader/set-key-for-mode mode
        "d" 'cider-find-var
        "D" 'cider-doc
        "bn" 'cider-browse-ns
        "z" 'cider-switch-to-repl-buffer
        "ji" 'cider-jack-in))))



(use-package evil-escape
  :ensure t
  :init
  (progn
    (evil-escape-mode 1)
    (setq-default evil-escape-key-sequence "jh")))

(use-package restart-emacs
  :ensure t)

(use-package badger-theme
  :ensure t)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package clj-refactor
  :ensure t
  :init
  (progn
    (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)))

(use-package neotree
  :ensure t
  :init
  (progn
    (evil-leader/set-key "3" 'neotree-toggle)
    (add-hook 'neotree-mode-hook
              (lambda ()
                (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
                (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
                (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
                (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
                (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
                (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
                (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))))


(use-package rainbow-delimiters
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))
