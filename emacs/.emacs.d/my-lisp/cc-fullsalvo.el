;; cc-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun my-c-lineup-inclass (langelem)
  (let ((inclass (assoc 'inclass c-syntactic-context)))
    (save-excursion
      (goto-char (c-langelem-pos inclass))
      (if
	  (or (looking-at "struct")
	      (looking-at "typedef struct"))
	  '+ '++))))

(setq c-default-style "user"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)
(c-set-offset 'substatement-open '0)
(c-set-offset 'inclass           '+)
(c-set-offset 'topmost-intro     '0)
(c-set-offset 'access-label      '-)
