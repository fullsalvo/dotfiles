;; fullsalvo's emacs initialization

;;modeline
(setq-default mode-line-format
			  (list " "
					'mode-line-buffer-identification
					'(mode-line-modified " [%+]    ")
					'mode-name
					'(line-number-mode "     %l, ")
					'(column-number-mode "%c   ")
					'(vc-mode vc-mode)))

(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; External setting file load calls

(mapc 'load (file-expand-wildcards "~/.emacs.d/my-lisp/*.el"))

;; Recently opened file list

(load "recentf-buffer")
(global-set-key [?\C-c ?r ?f] 'recentf-open-files-in-simply-buffer)

;; Colorscheme template

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'seti t)

(column-number-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-vimish-fold-mode t)
 '(fringe-mode 0 nil (fringe))
 '(vimish-fold-global-mode t))

(global-linum-mode 1)
(setq linum-format "%d ")

(global-font-lock-mode 1)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

(add-hook 'prog-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(if (not (eq nil (get-buffer "*Messages*"))) (kill-buffer "*Messages*"))

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

(setq Buffer-menu-use-frame-buffer-list nil)

(global-set-key [(control shift k)] 'kill-other-buffers)

;; toggle menu bar
(global-set-key [f12] 'menu-bar-mode)

(define-key minibuffer-inactive-mode-map [mouse-1] nil)

;; Make window title filename regardless of number of buffers
(setq frame-title-format "%b")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "C-x c") 'toggle-comment-on-line)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key [f13] 'reload-emacs)
(show-paren-mode t)
(setq-default word-wrap t)
(setq-default python-indent-offset 4)

(global-hl-line-mode t)
(global-set-key (kbd "C-x a") 'whitespace-mode)
(setq default-tab-width 4)

(mapc
(lambda (face)
(set-face-attribute face nil :weight 'normal))
(face-list))
