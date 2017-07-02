;; For the major modes I've added for my own use

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; these lines enable the use of gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" )
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; yaml mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	  (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; toml mode
(require 'toml-mode)

;; cc-mode
;; c indenting
(defun my-c-lineup-inclass (langelem)
  (let ((inclass (assoc 'inclass c-syntactic-context)))
    (save-excursion
      (goto-char (c-langelem-pos inclass))
      (if (or (looking-at "struct")
              (looking-at "typedef struct"))
          '+
        '++))))

(c-set-offset 'substatement-open 0)
(c-set-offset 'access-label '-)
(c-set-offset 'inclass 'my-c-lineup-inclass)
;; (c-set-offset 'substatement 0)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq c-default-style "linux"
      c-basic-offset 8)
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
