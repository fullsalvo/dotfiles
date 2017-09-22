;;; fullsalvo-theme.el
;; ===========================

(deftheme fullsalvo
  "Fullsalvo - A Custom Theme")

(let ((blue "#7e95f0")
      (green "#79c490")
      (yellow "#bfd491")
      (red "#ac8a8a")
      (magenta "#af91da")
      (cyan "#acced6")
      (black "#434343")
      (white "#dae0d8")
      (background   "#0f1f24")
      (background-2 "#434343")
      (background-3 "#dae0d8")
      (background-4 "#1f1f1f")
      (text "#92a19a")
      (text-2 "#858D8A")
      (text-3 "#434343")
      (text-4 "#2F3C42")
      (text-highlight "#dddddd")
      (text-region "#434546")
      (text-dired "#A0A0A0")
      (input-text "#92a19a")
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
   `(font-latex-sectioning-1-face ((t (:family "Fira Code" :height 80))))
   `(font-latex-sectioning-2-face ((t (:family "Fira Code" :height 80))))
   `(font-latex-sectioning-3-face ((t (:family "Fira Code" :height 80))))
   `(font-latex-sectioning-4-face ((t (:family "Fira Code" :height 80))))
   `(font-latex-sectioning-5-face ((t (:family "Fira Code" :height 80))))
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

   ;; Company
   ;; -------
   `(company-echo-common ((t (:foreground ,text-3))))
   `(company-preview ((t (:background nil :foreground ,text-3))))
   `(company-preview-common ((t (:inherit company-preview))))
   `(company-preview-search ((t (:inherit company-preview))))
   `(company-scrollbar-bg ((t (:background ,text-highlight))))
   `(company-scrollbar-fg ((t (:background ,text-3))))
   `(company-template-field ((t (:background nil :foreground ,text-3))))
   `(company-tooltip ((t (:background nil :foreground ,text))))
   `(company-tooltip-annotation ((t (:foreground ,text-3))))
   `(company-tooltip-common ((t (:foreground ,red))))
   `(company-tooltip-selection ((t (:background ,text-3))))

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
