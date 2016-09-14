;; Use Evil-mode
(require 'evil)
(evil-mode 1)
;; Use vimish-folding
(require 'evil-vimish-fold)
(evil-vimish-fold-mode 1)
;; Make the cursor the bar, rather than the default
(setq evil-insert-state-cursor '("#eeeeee" (hbar . 2)))
;; Use Evil-Leader and set keybinds
(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "f" 'find-file
 "k" 'kill-buffer
 "r" 'recentf-open-more-files
 "c" 'comment-region
 "SPC" 'execute-extended-command
 "b" 'vimish-fold
 "n" 'vimish-fold-toggle
 "d" 'vimish-fold-delete)
;; Remove the normal functionality of evil space key
(define-key evil-normal-state-map (kbd "<SPC>") nil)
;; Customize the appearance of vimish folds
(custom-set-faces
'(vimish-fold-overlay ((t (:inherit nil :background "#1f1f1f"))))
'(vimish-fold-fringe ((t (:inherit nil :foreground "#eeeeee"))))
'(vimish-fold-mouse-face ((t (:inherit nil :foreground "#1f1f1f" :background "#4f4f4f")))))
(custom-set-variables
 '(vimish-fold-global-mode t))
(setq vimish-fold-header-width 40)
