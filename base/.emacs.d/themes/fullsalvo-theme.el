;;; fullsalvo-theme.el
;; ===========================

(deftheme fullsalvo
  "Fullsalvo - A Custom Theme")

(let ((blue "#708ca2")
      (green "#72a89c")
      (yellow "#90a996")
      (red "#7e6565")
      (magenta "#817f98")
      (cyan "#9aa7c0")
      (black "#313131")
      (white "#a7a59c")
      (background   "#1c1c22")
      (background-2 "#313131")
      (background-3 "#a7a59c")
      (background-4 "#1f1f1f")
      (text "#bcbcbc")
      (text-2 "#858D8A")
      (text-3 "#313131")
      (text-4 "#2F3C42")
      (text-highlight "#FFFFFF")
      (text-region "#434546")
      (text-dired "#A0A0A0")
      (input-text "#CCCCCC")
      (light-blue "#75E5F4")
      (dark-blue "#4F99D3")
      (intense-green "#B3BD54"))

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
   `(font-lock-doc-face ((t (:foreground ,blue))))
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
   `(font-latex-sectioning-1-face ((t (:family "bitbuntu" :height 80))))
   `(font-latex-sectioning-2-face ((t (:family "bitbuntu" :height 80))))
   `(font-latex-sectioning-3-face ((t (:family "bitbuntu" :height 80))))
   `(font-latex-sectioning-4-face ((t (:family "bitbuntu" :height 80))))
   `(font-latex-sectioning-5-face ((t (:family "bitbuntu" :height 80))))
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
   `(hl-line ((t (:background , background-4)))))


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
