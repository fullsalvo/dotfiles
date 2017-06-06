;; fsterm.el -- fullsalvo's non-gui emacs theme
;; =====================================

(deftheme fsterm
  "Fullsalvo - A Custom Theme")

(let (
	  (nblack		  "black")
	  (nred	          "red")
	  (ngreen		  "green")
	  (nyellow		  "blue")
	  (nmagenta       "magenta")
	  (ncyan		  "cyan")
	  (nwhite		  "white")
	  (bblack		  "brightblack")
	  (bred			  "brightred")
	  (bgreen		  "brightgreen")
	  (byellow		  "brightyellow")
	  (bblue		  "brightblue")
	  (bmagenta		  "brightmagenta")
	  (bcyan		  "brightcyan")
	  (bwhite		  "brightwhite")
	  (fground        "color-255")
	  (bground		  "color-254")
	  )

  (custom-theme-set-faces
   'fsterm

   ;; Basics
   ;; ========================

   `(highlight ((t (:background ,bblack))))
   `(error ((t (:foreground ,bred :weight normal :underline (:color ,bred :style line)))))

   `(isearch ((t (:box nil :underline (:color ,fground :style line)))))
   `(lazy-highlight ((t :background ,fground :foreground ,bground :box nil :weight normal)))
   `(mode-line ((t (:foreground ,fground :background ,bground :overline ,fground :underline (:color ,fground :style line)))))
   `(mode-line-buffer-id ((t (:weight normal :foreground ,fground))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-highlight ((t (:box (:line-width 1 :color ,fground)))))
   `(mode-line-inactive ((t (:weight light :foreground ,bground :distant-foreground ,bground :background ,fground :overline ,fground))))


   `(match ((t :box nil (:weight normal :foreground ,fground :background ,bground))))
   )
  )

;;;###autoload
(and load-file-name
	 (boundp 'custom-theme-load-path)
	 (add-to-list 'custom-theme-load-path
				  (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'fsterm)

;; fsterm.el ends here
