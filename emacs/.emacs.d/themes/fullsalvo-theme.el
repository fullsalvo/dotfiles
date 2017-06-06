;;; fullsalvo-theme.el
;; ===========================

(deftheme fullsalvo
  "Fullsalvo - A Custom Theme")

(let ((blue "#4591e7")
      (green "#36eb8c")
      (yellow "#c2f139")
      (red "#e64c4c")
      (magenta "#9e3f69")
      (cyan "#63decd")
      (black "#7e8798")
      (white "#aebbd3")
      (background   "#353945")
      (background-2 "#7e8798")
      (background-3 "#aebbd3")
      (background-4 "#1f1f1f")
      (text "#becde7")
      (text-2 "#858D8A")
      (text-3 "#7e8798")
      (text-4 "#2F3C42")
      (text-highlight "#FFFFFF")
      (text-region "#434546")
      (text-dired "#A0A0A0")
      (input-text "#becde7")
      (light-blue "#75E5F4")
      (dark-blue "#4F99D3")
      (intense-green "#B3BD54")
	  (linehl "#1f1f1f"))

  (custom-theme-set-faces
   'fullsalvo

   ;; Basics
   ;; ============================

   `(default ((t (:background ,background :foreground ,text))))
   `(cursor ((t (:background ,input-text :foreground ,background))))
   `(highlight ((t (:background ,text-highlight))))
   `(minibuffer-prompt ((t (:foreground ,dark-blue :weight normal))))
   `(region ((t (:background ,text-region))))
   `(error ((t (:foreground ,red :weight normal :underline (:color ,red :style line)))))

   `(isearch ((t (:background ,background :foreground ,text :box (:line-width 1 :color ,dark-blue) :weight normal))))
   `(lazy-highlight ((t (:background ,background :foreground ,text-2 :box (:line-width 1 :color ,dark-blue)))))
   `(mode-line ((t (:foreground ,text :background ,background :overline ,text :underline (:color ,text :style line)))))
   `(mode-line-buffer-id ((t (:weight normal :foreground ,text))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-highlight ((t (:box (:line-width 1 :color ,text)))))
   `(mode-line-inactive ((t (:weight light :foreground ,background :distant-foreground ,background :background ,text :overline ,text))))
   `(secondary-selection ((t (:background ,background-2))))
   `(trailing-whitespace ((t (:background ,background-3))))
   `(match ((t (:weight bold :foreground ,background :background ,intense-green))))
   `(next-error ((t (:inherit (region)))))
   `(query-replace ((t (:inherit (isearch)))))

   `(widget-button ((t (:weight normal))))

   ;; General Font Locks
   ;; ============================

   `(font-lock-builtin-face ((t (:foreground ,magenta))))
   `(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
   `(font-lock-comment-face ((t (:foreground ,text-3))))
   `(font-lock-constant-face ((t (:foreground ,red))))
   `(font-lock-doc-face ((t (:foreground ,green))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,red))))
   `(font-lock-negation-char-face ((t nil)))
   `(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
   `(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   `(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,blue))))
   `(font-lock-warning-face ((t (:weight medium :inherit (error)))))

   ;; Language Font Locks
   ;; ============================

   ;; LaTeX
   ;; -----
   `(font-latex-math-face ((t (:foreground ,magenta))))
   `(font-latex-string-face ((t (:foreground ,green))))
   `(font-latex-sectioning-1-face ((t (:family "Lime" :height 80))))
   `(font-latex-sectioning-2-face ((t (:family "Lime" :height 80))))
   `(font-latex-sectioning-3-face ((t (:family "Lime" :height 80))))
   `(font-latex-sectioning-4-face ((t (:family "Lime" :height 80))))
   `(font-latex-sectioning-5-face ((t (:family "Lime" :height 80))))
   `(font-latex-warning-face ((t (:foreground "#FF0000"))))

   ;; Markdown
   ;; --------
   `(markdown-header-face ((t (:inherit font-lock-function-name-face))))

   ;; Shell
   ;; -----
   `(sh-quoted-exec ((t (:foreground ,red))))
   `(sh-heredoc ((t (:foreground ,yellow))))

   ;; Mode-Specific Font Locks
   ;; ============================

   ;; Parens
   ;; ------
   `(show-paren-match ((t (:foreground ,text-2 :underline (:color ,dark-blue :style line)))))
   `(show-paren-mismatch ((t (:foreground ,text-2 :underline (:color ,red :style line)))))

   ;; Dired
   ;; -----
   `(dired-directory ((t (:foreground ,green))))
   `(dired-header ((t (:foreground "white"  :background ,blue))))
   `(dired-ignored ((t (:foreground ,text-3))))
   `(dired-flagged ((t (:foreground ,red :weight bold))))
   `(dired-marked ((t (:background ,blue :foreground "white" :weight normal))))
   `(dired-perm-write ((t (:foreground ,yellow :weight ultra-bold))))
   `(dired-symlink ((t (:foreground ,magenta :weight normal))))
   `(dired-warning ((t (:inherit (font-lock-warning-face)))))

   ;; Lines
   ;; -----
   `(linum ((t (:foreground ,text-3  :weight light :height 0.9))))
   `(fringe ((t (:background ,background-3 :foreground ,text-4))))
   `(left-margin ((t (nil))))
   `(hl-line ((t (:background , linehl))))

   ;; Custom
   '(evil-mode-face ((t (:foreground ,background :background ,text))))
   )

(custom-theme-set-variables
 'fullsalvo

  `(cursor-type 'hbar)
  `(ansi-color-names-vector [ ,background ,red ,green ,yellow ,blue ,magenta ,blue ,text])
  `(ansi-term-color-vector [unspecified ,background ,red ,green ,yellow ,blue ,magenta ,blue ,text])))


;;;###autoload
(and load-file-name
  (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'fullsalvo)

;;; fullsalvo-theme.el ends here
