;; fullsalvo's emacs initialization
;; ====================================================================

;; Add/Remove GUI Features
;; ===========================

;; Buffer Changes
;; ===========================

;; Hide the Buffer List when switching buffer.
(setq Buffer-menu-use-frame-buffer-list nil)

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Language-Specific Changes
;; ===========================

;; LaTeX
;; -----

(require 'tex)
(setq TeX-PDF-mode t
      TeX-auto-save t
      TeX-parse-self t
      TeX-view-program-list '(("zathura" "zathura %o"))
      TeX-view-program-selection '((output-pdf "zathura"))
      TeX-global-PDF-mode t)

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

;; Indent to a column
(global-set-key (kbd "C-c z") 'indent-to-column)

;; Update packages (To be used in the package-list-packages buffer)
(global-set-key (kbd "C-c C-g u") (lambda () (interactive) (package-menu-mark-upgrades) (package-menu-execute)))

;; "Customize Emacs"
;; ============================

;; Move variables from 'customize'
(setq custom-file (make-temp-file "emacs-custom"))
(load custom-file)

;; User-defined custom variables
(custom-set-variables
 '(font-latex-math-environments
   (quote
    ("display" "displaymath" "equation" "eqnarray" "gather" "math" "multline" "align" "alignat" "xalignat" "xxalignat" "flalign" "eqn")))
 '(package-selected-packages
   (quote
    (evil-magit projectile company page-break-lines toml-mode evil-leader auctex))))

;; Special Functions
;; =================
;; starts the initial buffer
(start-startify)
