(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(fringe-mode 0 nil (fringe)))
;; General emacs Configuration
;(load-theme 'deeper-blue)

(global-linum-mode 1)
(setq linum-format "%d ")
;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
;;(defun remove-scratch-buffer ()
;;  (if (get-buffer "*scratch*")
;;      (kill-buffer "*scratch*")))
;;(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
;;(kill-buffer "*Messages*")

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

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'seti t)

(set-foreground-color "#FFFFFF")
(setq Buffer-menu-use-frame-buffer-list nil)

;; don't sleep emacs accidentally
(global-set-key [(control z)] nil)
(global-set-key [(control z)] 'undo)

;; toggle menu bar
(global-set-key [f12] 'menu-bar-mode)

(define-key minibuffer-inactive-mode-map [mouse-1] nil)

;; Make window title filename regardless of number of buffers
(setq frame-title-format "%b")

;; yaml mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	  (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; use custom font faces
(custom-set-faces
 '(default ((t (:family "{{ emacsfont }}" :foundry "unknown" :slant normal :weight normal :height {{ emacsheight }} :width normal)))))


(add-hook 'before-save-hook 'delete-trailing-whitespace)
