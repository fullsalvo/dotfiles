;; The following line is due to changes made for whizkers' utility
{{ = <% %> = }}
;; fullsalvo's emacs initialization

;; External setting file load calls

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/modes.el")

(load "recentf-buffer")
(global-set-key [?\C-c ?r ?f] 'recentf-open-files-in-simply-buffer)

;; Colorscheme template

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'seti t)

(custom-set-variables
 '(column-number-mode t)
 '(fringe-mode 0 nil (fringe)))

(global-linum-mode 1)
(setq linum-format "%d ")

(global-font-lock-mode 1)

(add-hook 'prog-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c <right>") 'hs-show-block)
	    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
	    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
	    (local-set-key (kbd "C-c <down>")  'hs-show-all)
	    (setq hs-hide-comments-when-hiding-all nil)
	    (hs-minor-mode t)))

;; Makes *scratch* empty.
(setq initial-scratch-message "")

(add-hook 'prog-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)
;; Set Window Size & Prevent Annoyances
(setq default-frame-alist
'((width . 80) (height . 40)))
(setq inhibit-splash-screen t)

;; LaTeX Configuration
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(require 'tex)
(TeX-global-PDF-mode t)

(scroll-bar-mode -1)
(menu-bar-mode 0)
(tool-bar-mode 0)

(setq make-backup-files nil)
(setq auto-save-default nil)

(set-foreground-color "#FFFFFF")
(setq Buffer-menu-use-frame-buffer-list nil)

;; don't sleep emacs accidentally
(global-set-key [(control z)] nil)
(global-set-key [(control z)] 'undo)
(global-set-key [(control shift k)] 'kill-other-buffers)

;; toggle menu bar
(global-set-key [f12] 'menu-bar-mode)

(define-key minibuffer-inactive-mode-map [mouse-1] nil)

;; Make window title filename regardless of number of buffers
(setq frame-title-format "%b")

;; use custom font faces
(custom-set-faces
 '(default ((t (:family "<% emacsfont %>" :foundry "unknown" :slant normal :weight normal :height <% emacsheight %> :width normal)))))


(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; use recentf
;;(initial-buffer-choice nil)

(global-set-key (kbd "C-x c") 'toggle-comment-on-line)
(show-paren-mode t)
(setq-default word-wrap t)
(setq-default python-indent-offset 4)
