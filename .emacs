(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(fringe-mode 0 nil (fringe)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Tamsyn" :foundry "unknown" :slant normal :weight normal :height 100 :width normal))))
 '(font-latex-bold-face ((t (:inherit bold :foreground "purple3"))))
 '(font-latex-italic-face ((t (:inherit italic :foreground "medium spring green"))))
 '(font-latex-math-face ((t (:foreground "LightSteelBlue2"))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face :foreground "#FFFFFF" :height 1.1))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face :foreground "turquoise2" :height 1.1))))
 '(font-latex-warning-face ((t (:inherit bold :foreground "#FF0000"))))
 '(font-lock-builtin-face ((t (:foreground "#696969"))))
 '(font-lock-comment-face ((t (:foreground "#8c8c8c"))))
 '(font-lock-function-name-face ((t (:foreground "#6d1922"))))
 '(font-lock-keyword-face ((t (:foreground "#ab2836" :weight normal))))
 '(font-lock-string-face ((t (:foreground "#FF0000"))))
 '(font-lock-type-face ((t (:foreground "#cd2626"))))
 '(font-lock-variable-name-face ((t (:foreground "#d85a67"))))
 '(highlight ((t (:background "#faeaec"))))
 '(region ((t (:background "#53131a"))))
 '(sh-heredoc ((t (:foreground "#b22222" :weight bold))))
 '(sh-quoted-exec ((t (:foreground "#894a51")))))

;; General emacs Configuration
;(load-theme 'deeper-blue)

(global-linum-mode 1)
(setq linum-format "%d ")
;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

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
'((width . 80) (height . 80)))
(setq inhibit-splash-screen t)

;; LaTeX Configuration
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(require 'tex)
(TeX-global-PDF-mode t)
;;(defcustom tex-my-viewer "zathura --fork -s -x \"emacsclient --eval '(progn (switch-to-buffer  (file-name-nondirectory \"'\"'\"%{input}\"'\"'\")) (goto-line %{line}))'\"" 

(set-cursor-color "#FFFFFF")
(set-mouse-color "#FFFFFF")

(set-foreground-color "#FFFFFF")
(set-background-color "#1F1F1F")
(add-to-list 'default-frame-alist '(background-color . "#1F1F1F"))

(scroll-bar-mode -1)
(menu-bar-mode 0)
(tool-bar-mode 0)
