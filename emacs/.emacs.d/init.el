;; fullsalvo's emacs initialization
;; ====================================================================

(progn ; initial startup
  (defvar before-user-init-time (current-time)
    "Value of `current-time' when Emacs begins loading the init file.")
  (setq package-archives
	'(("gnu" . "https://elpa.gnu.org/packages/")
	  ("melpa" . "https://melpa.org/packages/")
	  ("melpa-stable" . "https://stable.melpa.org/packages/")))
  (package-initialize)
  (setq user-init-file "~/.emacs.d/init.el")
  (setq user-emacs-directory (file-name-directory user-init-file))
  (message "Loading %s..." user-init-file)
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
  (if window-system (load-theme 'fullsalvo t) (load-theme 'fsterm t))
  (setq inhibit-startup-buffer-menu t)
  (setq Buffer-menu-use-frame-buffer-list nil)
  (setq inhibit-startup-screen t)
  (fset 'yes-or-no-p 'y-or-n-p) ;; changes yes or no responses to y or n
  (if (file-accessible-directory-p (concat user-emacs-directory "my-lisp"))
      (mapc 'load (file-expand-wildcards (concat user-emacs-directory "my-lisp/*.el"))))
  (setq frame-title-format "%b")
  (setq linum-format " %d ")
  (setq initial-scratch-message "")
  (column-number-mode 1)
  (global-font-lock-mode 1)
  (set-fringe-mode 0)
  (scroll-bar-mode -1)
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (save-place-mode 1)
  (setq-default word-wrap t)
  (setq default-tab-width 4)
  (global-hl-line-mode t)
  (show-paren-mode t)
  (add-hook 'prog-mode-hook 'linum-mode)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;; automatically kills completions buffer when no longer useful
  (add-hook 'minibuffer-exit-hook
	    '(lambda ()
	       (let ((buffer "*Completions*")) (and (get-buffer buffer)
						    (kill-buffer buffer)))))

  ;; enable the x-primary clipboard
  (setq x-select-enable-clipboard t)

  ;; stop automatic file creation
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq auto-save-timeout 0)
  (setq auto-save-interval 0)

  ;; smoother scrolling
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil)            ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
  (setq scroll-step 1)                                ;; keyboard scroll one line at a time
  (setq scroll-conservatively 100000)
  (setq scroll-preserve-screen-position 1)
  (setq max-mini-window-height 0.01)

  ;; Use UTF-8
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8))

;; modeline functions
(defun evil-mode-state ()
  "Determines and sets the evil mode text in the modeline"
  (cond ((eq evil-state 'normal   )   (format "  NORMAL   " ))
	((eq evil-state 'visual   )   (format "  VISUAL   " ))
	((eq evil-state 'insert   )   (format "  INSERT   " ))
	((eq evil-state 'emacs    )   (format "  EMACS    " ))
	((eq evil-state 'operator )   (format "  OPERATOR " ))
	((eq evil-state 'motion   )   (format "  MOTION   " ))
	((eq evil-state 'replace  )   (format "  REPLACE  " ))
	))

(progn ; modeline
  (setq-default mode-line-format
		(list " "
		      'mode-line-buffer-identification
		      '(:eval (evil-mode-state))
		      '(mode-line-modified " [%+]    ")
		      'mode-name
		      '(2) ;; adds a padding
		      '(vc-mode vc-mode)
		      '(line-number-mode "     %l, ")
		      '(column-number-mode "%c   "))))

(progn ; use-package
  (require 'use-package)
  ;; (setq use-package-verbose t)
  )

(use-package cc-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  (setq c-default-style "user")
  (setq c-basic-offset 8)
  (setq tab-width 8)
  (setq indent-tabs-mode t)

  (defun my-c-lineup-inclass (langelem)
    (let ((inclass (assoc 'inclass c-syntactic-context)))
      (save-excursion
	(goto-char (c-langelem-pos inclass))
	(if
	    (or (looking-at "struct")
		(looking-at "typedef struct"))
	    '+ '++))))

  (c-set-offset 'substatement-open '0)
  (c-set-offset 'inclass           '+)
  (c-set-offset 'topmost-intro     '0)
  (c-set-offset 'access-label      '-))

(use-package company
  :hook (prog-mode . global-company-mode)
  :config
  (setq company-idle-delay 1.0)
  (setq company-minimum-prefix-length 3)
  (setq company-tooltip-flip-when-above t))

(use-package custom
  :config
  (setq custom-file (make-temp-file "emacs-custom"))
  (when (file-exists-p custom-file)
    (load custom-file)))

(use-package evil
  :ensure t
  :init (evil-mode 1)
  :config
  (setq evil-insert-state-cursor '("#eee" (hbar . 2)))
  (define-key evil-normal-state-map (kbd "<SPC>") nil))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode t)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "f" 'find-file
    "k" 'kill-buffer
    "r" 'recentf-open-more-files
    "c" 'comment-region
    "SPC" 'execute-extended-command))

(use-package gnuplot
   :config
  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist)))

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 4)
  (setq ivy-count-format "%d/%d "))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode  (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package page-break-lines
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq python-indent 4)
  (setq python-indent-offset 4)
  (setq python-indent-guess-indent-offset-verbose nil))

(use-package recentf
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 50)
  (setq recentf-max-saved-items 200))

(use-package rst
  :hook
  (remove-hook 'before-save-hook 'delete-trailing-whitespace t))

(use-package startify-buffer
  :after projectile
  :requires page-break-lines
  :config
  (setq startify-title "     .d88b. 88888b.d88b.  8888b.  .d8888b.d8888b
    d8P  Y8b888 `888 `88b    `88bd88P'   88K
    88888888888  888  888.d888888888     `Y8888b.
    Y8b.    888  888  888888  888Y88b.        X88
     `Y8888 888  888  888`Y888888 `Y8888P 88888P' "))

(use-package tex
  :ensure auctex
  :demand t
  :config (setq TeX-PDF-mode t)
  (setq font-latex-math-environments
	(quote
	 ("display" "displaymath" "equation" "eqnarray" "gather" "math" "multline" "align" "alignat" "xalignat" "xxalignat" "flalign" "eqn")))
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-view-program-list '(("zathura" "zathura %o")))
  (setq TeX-view-program-selection '((output-pdf "zathura")))
  (setq TeX-global-PDF-mode t))

(use-package toml-mode)

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-hook 'yaml-mode-hook (lambda ()
			      (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(progn ;add keybinds
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
  ;; Indent to a column
  (global-set-key (kbd "C-c z") 'indent-to-column)
  ;; Update packages (To be used in the package-list-packages buffer)
  (global-set-key (kbd "C-c C-g u") (lambda () (interactive) (package-menu-mark-upgrades) (package-menu-execute))))

(progn ; finish startup
  ;; disable bold fonts
  (mapc (lambda (face) (set-face-attribute face nil :weight 'normal)) (face-list))
  (add-hook 'after-init-hook
	    (lambda ()
	      (message
	       "Loading %s...done (%.3fs) [after-init]" user-init-file
	       (float-time (time-subtract (current-time)
					  before-user-init-time)))))
  (start-startify))
