;; Kill Other Buffers function
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; Reload Emacs
(defun reload-emacs ()
  "Reload ~/.emacs."
  (interactive)
  (load-file "/home/fullsalvo/.emacs.d/init.el")
  (mapc 'load (file-expand-wildcards "~/.emacs.d/my-lisp/*.el"))
  (evil-leader-mode))

;; Reload buffers
(defun revert-buf ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer t t))

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))

;; Add comment to line
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
)
