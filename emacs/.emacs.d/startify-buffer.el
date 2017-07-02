;; startify-buffer.el
;;
;; emacs-startify

(defconst startify-buffer-name "*startify*"
  "The startify buffer name")

(defvar startify-title "    ┏━╸┏┳┓┏━┓┏━╸┏━┓
    ┣╸ ┃┃┃┣━┫┃  ┗━┓
    ┗━╸╹ ╹╹ ╹┗━╸┗━┛"
  "Startup buffer message")

(defvar startify-buffer-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [down-mouse-1] 'widget-button-click)
    (define-key map (kbd "RET") 'widget-button-press)

    (define-key map [tab] 'widget-forward)
    (define-key map (kbd "j") 'widget-forward)
    (define-key map (kbd "C-i") 'widget-forward)

    (define-key map [backtab] 'widget-backward)
    (define-key map (kbd "k") 'widget-backward)

    (define-key map (kbd "C-r") 'startify-refresh)
    (define-key map (kbd "q") 'quit-window)
    map)
  "emacs-startify keymap")

(defvar startify-max-list-len 12
  "Maximum startup list length")

(with-eval-after-load 'evil
  (evil-make-overriding-map startify-buffer-mode-map 'motion))

(define-derived-mode startify-buffer-mode fundamental-mode "Startify"
  "startify major mode."
  :group 'startup
  :syntax-table nil
  :abbrev-table nil
  (use-local-map startify-buffer-mode-map)
  (page-break-lines-mode)
  (linum-mode 0)
  (setq buffer-read-only t
	truncate-lines t)
  ;; needed to make tab work correctly in terminal
  (evil-define-key 'motion startify-buffer-mode-map
    (kbd "C-i") 'widget-forward)
  ;; motion state since this is a special mode
  (evil-set-initial-state 'startify-buffer-mode 'motion))

(defun startify-insert-title (title)
  (insert (format "\n%s\n" title)))

(defun startify-mode-line (format)
  (with-current-buffer (get-buffer-create startify-buffer-name)
    (setq mode-line-format format)))

(defun startify-insert-page-break ()
  (startify-append "\n\n"))

(defun startify-append (msg)
  "Append MSG to startify buffer."
  (with-current-buffer (get-buffer-create startify-buffer-name)
    (goto-char (point-max))
    (let ((buffer-read-only nil))
      (insert msg))))

(defun startify-insert-string-list (list-display-name list)
  "Insert a non-interactive startup list in the home buffer.
LIST-DISPLAY-NAME: the displayed title of the list.
LIST: a list of strings displayed as entries."
  (when (car list)
    (insert list-display-name)
    (mapc (lambda (el)
	    (insert
	     "\n"
	     (with-temp-buffer
	       (insert el)
	       (fill-paragraph)
	       (goto-char (point-min))
	       (insert "    - ")
	       (while (= 0 (forward-line))
		 (insert "      "))
	       (buffer-string))))
	  list)))

(defmacro startify-add-shortcut
    (shortcut-char search-label &optional no-next-line)
  "Add a single-key keybinding for quick navigation in the home buffer.
Navigation is done by searching for a specific word in the buffer.
SHORTCUT-CHAR: the key that the user will have to press.
SEARCH-LABEL: the word the cursor will be brought under (or on).
NO-NEXT-LINE: if nil the cursor is brought under the searched word."
  `(define-key startify-buffer-mode-map
     ,shortcut-char (lambda ()
		      (interactive)
		      (unless (search-forward ,search-label (point-max) t)
			(search-backward ,search-label (point-min) t))
		      ,@(unless no-next-line
			  '((forward-line 1)))
		      (back-to-indentation))))

(defun startify-insert-file-list (list-display-name list)
  "Insert an interactive list of files in the home buffer.
LIST-DISPLAY-NAME: the displayed title of the list.
LIST: a list of string pathnames made interactive in this function."
  (when (car list)
    (insert list-display-name)
    (mapc (lambda (el)
	    (insert "\n    ")
	    (widget-create 'push-button
			   :action `(lambda (&rest ignore)
				      (find-file-existing ,el))
			   :mouse-face 'highlight
			   :follow-link "\C-m"
			   :button-prefix ""
			   :button-suffix ""
			   :format "%[%t%]"
			   (abbreviate-file-name el)))
	  list)))

(defun startify-subseq (seq start end)
  "Adapted version of `cl-subseq'.
Use `cl-subseq', but accounting for end points greater than the size of the
list.  Return entire list if end is omitted.
SEQ, START and END are the same arguments as for `cl-subseq'"
  (let ((len (length seq)))
    (cl-subseq seq start (and (number-or-marker-p end)
			      (min len end)))))

(defun startify-do-insert-startupify-lists ()
  "Insert the startup lists in the current buffer."
  (recentf-mode)
  (let ((list-separator "\n\n")
	(list-size startify-max-list-len))
    (when (startify-insert-file-list
	   "  Recent Files:"
	   (startify-subseq recentf-list 0 list-size))
      (startify-add-shortcut "r" "Recent Files:")
      (insert list-separator))
    (when (startify-insert-file-list
	   "  Projects:"
	   (startify-subseq (projectile-relevant-known-projects)
			    0 list-size))
      (startify-add-shortcut "p" "Projects:")
      (insert "\n"))))

(defun startify-insert-startup-lists ()
  "Insert startup lists in home buffer."
  (with-current-buffer (get-buffer startify-buffer-name)
    (let ((buffer-read-only nil))
      (goto-char (point-max))
      (insert "\n")
      (save-restriction
	(narrow-to-region (point) (point))
	(startify-do-insert-startupify-lists)
	(startify-insert-page-break)))))

(defvar startify-startup-lists t)

(defun startify-spawn-buffer (&optional refresh)
  "Create the special buffer for `startify-mode' and switch to it.
REFRESH if the buffer should be redrawn."
  (interactive)
  (let ((buffer-exists (buffer-live-p (get-buffer startify-buffer-name)))
	(save-line nil))
    (setq buffer-read-only nil)
    (when (or (not buffer-exists)
	      refresh)
      (with-current-buffer (get-buffer-create startify-buffer-name)
	(page-break-lines-mode)
	(save-excursion
	  (when (> (buffer-size) 0)
	    (set 'save-line (line-number-at-pos))
	    (let ((inhibit-read-only t))
	      (erase-buffer)))
	  (startify-insert-title startify-title)
	  (startify-insert-page-break)
	    (when startify-startup-lists
	      (startify-insert-startup-lists)
	      (set-buffer-modified-p nil)
	      (startify-buffer-mode))
	    (force-mode-line-update)
	    (startify-link-line)))
      (switch-to-buffer startify-buffer-name))))

(defun startify-link-line ()
  (interactive)
  (with-current-buffer startify-buffer-name
    (goto-char (point-min))
    (with-demoted-errors "startify-buffer: %s"
      (widget-forward 1))))

(defun startify-refresh ()
  (interactive)
  (startify-spawn-buffer t))

(defun start-startify ()
  "Open home Startify buffer and delete other windows.
Useful for making the home buffer the only visible buffer in the frame."
  (interactive)
  (startify-spawn-buffer)
  (delete-other-windows))

(provide 'startify-buffer)

;; end startify-buffer.el
