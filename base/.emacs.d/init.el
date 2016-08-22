;; fullsalvo's emacs initialization
;; ====================================================================

;; Allows use of MELPA
(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; External setting file load calls
(if (file-accessible-directory-p "~/.emacs.d/my-lisp")
	(mapc 'load (file-expand-wildcards "~/.emacs.d/my-lisp/*.el")))

;; Apply a custom color scheme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(if (display-graphic-p)
    (load-theme 'fullsalvo t))

;; add MRU buffer capabilities
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)

;; Add/Remove GUI Features
;; ===========================

;; Window title always displays current file name.
(setq frame-title-format "%b")

;; Show column number in modeline
(column-number-mode t)

;; Remove fringes from emacs edges
(set-fringe-mode 0)

;; Show Line Numbers
(global-linum-mode 1)

;; Set Line Number Format
(setq linum-format "  %d ")

;; Always Use Stylized Colors
(global-font-lock-mode 1)

;; Set startup window size
(setq default-frame-alist '((width . 80) (height . 40)))

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;; Remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Only type Y or N for Yes and No.
(fset 'yes-or-no-p 'y-or-n-p)

;; Remove the Scrollbar
(scroll-bar-mode -1)

;; Hide the Menubar
(menu-bar-mode 0)

;; Hide the Toolbar
(tool-bar-mode 0)

;; Highlight matching parentheses
(show-paren-mode t)

;; Line Wrapping doesn't break in the middle of a word
(setq-default word-wrap t)

;; Set Tab Width to 4
(setq default-tab-width 4)

;; Highlight the current line
(global-hl-line-mode t)

;; Do not make backup files
(setq make-backup-files nil)

;; Do not automatically save files
(setq auto-save-default nil)

;; Disable bold fonts
(mapc (lambda (face) (set-face-attribute face nil :weight 'normal)) (face-list))

;; Use UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; whitespace-cleanup-mode
(require 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode 1)

;; Modeline
;; ===========================

(setq-default mode-line-format
			  (list " "
					'mode-line-buffer-identification
					'(mode-line-modified " [%+]    ")
					'mode-name
					'(line-number-mode "     %l, ")
					'(column-number-mode "%c   ")
					'(vc-mode vc-mode)))

;; Buffer Changes
;; ===========================

;; Doesn't open the Emacs logo screen on startup
(setq inhibit-splash-screen t)

;; Open a blank buffer when opening scratch
(setq initial-scratch-message "")

;; Open to init file by default
;; (setq initial-buffer-choice "~")

;; Close the scratch buffer when entering a programming mode
(add-hook 'prog-mode-hook 'remove-scratch-buffer)

;; Close the messages buffer on emacs startup
(setq-default message-log-max nil)
(if (not (eq nil (get-buffer "*Messages*"))) (kill-buffer "*Messages*"))

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
		 (let ((buffer "*Completions*"))
		   (and (get-buffer buffer)
				(kill-buffer buffer)))))

;; Hide the Buffer List when switching buffer.
(setq Buffer-menu-use-frame-buffer-list nil)

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Language-Specific Changes
;; ===========================

;; LaTeX
;; -----

(require 'tex)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(TeX-global-PDF-mode t)

;; Python
;; ------

(setq-default python-indent-offset 4)

;; Custom Global Keybinds
;; ===========================

;; Kill all buffers except the current one.
(global-set-key [(control shift k)] 'kill-other-buffers)

;; Toggle menu bar
(global-set-key [f12] 'menu-bar-mode)

;; Disable clicking the minibuffer when nothing is there.
(define-key minibuffer-inactive-mode-map [mouse-1] nil)

;; Commenting One Line
(global-set-key (kbd "C-x c") 'toggle-comment-on-line)

;; Commenting a group of highlighted lines
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

;; Reload Emacs On-the-fly
(global-set-key [f13] 'reload-emacs)

;; Toggle Whitespace Mode
(global-set-key (kbd "C-x a") 'whitespace-mode)

;; Reload file when changes have been made
(global-set-key (kbd "C-x n") 'revert-buf)

;; Update packages (To be used in the package-list-packages buffer)
(global-set-key (kbd "C-c C-g u") (lambda () (interactive) (package-menu-mark-upgrades) (package-menu-execute)))
(custom-set-variables
 '(safe-local-variable-values (quote ((TeX-master . t))))
 '(vimish-fold-global-mode t))
