(defconst startify-buffer-name "*startify*"
  "The startify buffer name")

(defvar startify-title "    ┏━╸┏┳┓┏━┓┏━╸┏━┓
    ┣╸ ┃┃┃┣━┫┃  ┗━┓
    ┗━╸╹ ╹╹ ╹┗━╸┗━┛"
  "Startup buffer message")

(defvar startify-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [down-mouse-1] 'widget-button-click)
    (define-key map (kbd "RET") 'widget-button-press)

    (define-key map [tab] 'widget-forward)
    (define-key map (kbd "J") 'widget-forward)
    (define-key map (kbd "C-i") 'widget-forward)

    (define-key map [backtab] 'widget-backward)
    (define-key map (kbd "K") 'widget-backward)

    (define-key map "q" 'quit-window)
    map)
  "emacs-startify keymap")

(with-eval-after-load 'evil
  (evil-make-overriding-map startify-mode-map 'motion))
