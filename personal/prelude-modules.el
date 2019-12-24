;;; uncomment the modules you'd like to use and restart prelude afterwards

;; emacs irc client
(require 'prelude-erc)
(require 'prelude-ido) ;; super charges emacs completion for c-x c-f and more
(require 'prelude-ivy) ;; a mighty modern alternative to ido
(require 'prelude-helm) ;; interface for narrowing and search
(require 'prelude-helm-everywhere) ;; enable helm everywhere
(require 'prelude-company)
;; (require 'prelude-key-chord) ;; Binds useful features to key combinations

(global-evil-leader-mode)
(require 'prelude-evil)

;;; Programming languages support
(require 'prelude-c)
(require 'prelude-clojure)
(require 'prelude-coffee)
;; (require 'prelude-common-lisp)
(require 'prelude-css)
(require 'prelude-emacs-lisp)
;; (require 'prelude-erlang)
(require 'prelude-elixir)
;; (require 'prelude-go)
;; (require 'prelude-haskell)
(require 'prelude-js)
;; (require 'prelude-latex)
(require 'prelude-lisp)
;; (require 'prelude-ocaml)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
;; (require 'prelude-perl)
(require 'prelude-python)
;; (require 'prelude-ruby)
;; (require 'prelude-rust)
;; (require 'prelude-scala)
(require 'prelude-scheme)
(require 'prelude-shell)
(require 'prelude-scss)
(require 'prelude-ts)
;; (require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)
(require 'prelude-yaml)
