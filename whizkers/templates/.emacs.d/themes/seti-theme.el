;;; seti-theme.el --- A dark colored theme, inspired by Seti Atom Theme
;;
;;
;; Author: Vlad Piersec <vlad.piersec@gmail.com>
;; Version: 0.1
;; Keywords: themes
;; URL: https://github.com/caisah/seti-theme
;;
;; This file is not part of GNU Emacs.
;;
;; Licenese:
;;
;; This is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.
;;
;; This is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary
;;
;; Dark theme inspired by Atom's Seti 
;;
;; Tries to reproduce the feel of https://github.com/jesseweed/seti-ui
;;; Code

(deftheme seti
  "Seti - A theme inspired by Seti Atom Theme")

(let ((blue "{{ n_blue }}")
      (green "{{ n_green }}")
      (yellow "{{ n_yellow }}")
      (red "{{ n_red }}")
      (purple "{{ n_magenta }}")
      (background   "{{ bgc }}")
      (background-2 "#1E2326")      
      (background-3 "#d7e2e0")
      (background-4 "#101112")
      (text "{{ fgc }}")
      (text-2 "#858D8A")
      (text-3 "#41535B")
      (text-4 "#2F3C42")
      (text-highlight "#FFFFFF")
      (text-region "#434546")
      (text-dired "#A0A0A0")
      (input-text "#CCCCCC")
      (light-blue "#75E5F4")
      (dark-blue "#4F99D3")
      (intense-green "#B3BD54"))
    
  (custom-theme-set-faces
   'seti

   ;; Basics
   `(default ((t (:background ,background :foreground ,text))))
   `(cursor ((t (:background ,input-text :foreground ,background))))
   `(highlight ((t (:background ,text-highlight))))
   `(minibuffer-prompt ((t (:foreground ,dark-blue :weight normal))))
   `(region ((t (:background ,text-region))))
   `(error ((t (:foreground ,red :weight bold :underline (:color ,red :style line)))))
 
   `(isearch ((t (:background ,background :foreground ,text :box (:line-width 1 :color ,dark-blue) :weight bold))))
   `(lazy-highlight ((t (:background ,background :foreground ,text-2 :box (:line-width 1 :color ,dark-blue)))))
   `(mode-line ((t (:foreground ,text-4 :background ,background-3 :underline (:color ,text-4 :style line)))))
   `(mode-line-buffer-id ((t (:weight normal :foreground ,blue))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-highlight ((t (:box (:line-width 1 :color ,dark-blue)))))
   `(mode-line-inactive ((t (:weight light :foreground ,text :background ,background-2))))
   `(secondary-selection ((t (:background ,background-2))))
   `(trailing-whitespace ((t (:background ,background-3))))
   `(match ((t (:weight bold :foreground ,background :background ,intense-green))))
   `(next-error ((t (:inherit (region)))))
   `(query-replace ((t (:inherit (isearch)))))

   ;; Font Lock
   `(font-lock-builtin-face ((t (:foreground ,purple))))
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
   `(font-lock-warning-face ((t (:weight bold :inherit (error)))))

   ;; Fullsalvo Font Locks
   ;;LaTeX
   `(font-latex-math-face ((t (:foreground ,purple))))
   `(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face :height 1.1 :family "Terminus"))))
   `(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face :foreground "#FFFFFF" :height 1.1 :family "Terminus"))))
   `(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face :foreground "turquoise2" :height 1.1))))
   ;;Shell
   `(sh-quoted-exec ((t (:foreground ,red))))
   `(sh-heredoc ((t (:foreground ,yellow))))

   ;; Parens
   `(show-paren-match ((t (:foreground ,text-2 :underline (:color ,dark-blue :style line)))))
   `(show-paren-mismatch ((t (:foreground ,text-2 :underline (:color ,red :style line)))))

   ;; Dired
   `(dired-directory ((t (:foreground ,text :weight extrabold))))
   `(dired-header ((t (:foreground "white"  :background ,blue :weight bold))))
   `(dired-ignored ((t (:foreground ,text-3))))
   `(dired-flagged ((t (:foreground ,red :weight bold))))
   `(dired-marked ((t (:background ,blue :foreground "white" :weight normal))))
   `(dired-perm-write ((t (:foreground ,yellow :weight ultra-bold))))
   `(dired-symlink ((t (:foreground ,light-blue :weight normal))))
   `(dired-warning ((t (:inherit (font-lock-warning-face)))))

   ;; Lines
   `(linum ((t (:foreground ,text-4  :weight light :height 0.9))))
   `(fringe ((t (:background ,background-3 :foreground ,text-4))))
   `(left-margin ((t (nil))))
   `(hl-line ((t (:background ,background-4)))))

  
(custom-theme-set-variables
 'seti
 
  `(cursor-type 'hbar)
  `(ansi-color-names-vector [ ,background ,red ,green ,yellow ,blue ,purple ,blue ,text])
  `(ansi-term-color-vector [unspecified ,background ,red ,green ,yellow ,blue ,purple ,blue ,text])))
 

;;;###autoload
(and load-file-name
  (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'seti)

;;; seti-theme.el ends here