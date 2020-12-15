(prelude-require-packages '(god-mode))
(god-mode)
(define-key god-local-mode-map (kbd "z") #'repeat)
(define-key god-local-mode-map (kbd "i") #'god-local-mode)
(global-set-key (kbd "<escape>") #'god-mode-all)
(global-set-key (kbd "C-x C-1") #'delete-other-windows)
(global-set-key (kbd "C-x C-2") #'split-window-below)
(global-set-key (kbd "C-x C-3") #'split-window-right)
(global-set-key (kbd "C-x C-0") #'delete-window)

(defun my-god-mode-update-modeline ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "red"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))

(add-hook 'god-mode-enabled-hook #'my-god-mode-update-modeline)
(add-hook 'god-mode-disabled-hook #'my-god-mode-update-modeline)
