(require 'evil)
(evil-mode 1)
(require 'evil-vimish-fold)
(evil-vimish-fold-mode 1)
(setq evil-insert-state-cursor '("#CCCCCC" (hbar . 2)))
(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "f" 'find-file
 "k" 'kill-buffer
 "r" 'recentf-open-files-in-simply-buffer
 "c" 'comment-region
 "SPC" 'execute-extended-command)
;;(require 'evil-magit)
