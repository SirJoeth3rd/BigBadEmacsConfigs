;;set the capslock-f key to toggel cmd and insert mode
(global-set-key (kbd "C-f") 'xah-fly-mode-toggle)

;;set the dollar key in cmd mode to end of line, like vim
(define-key xah-fly-command-map (kbd "$") 'end-of-line)

;;control movement keys act like normal movement
;;this is a genius idea, wow ethan
(keyboard-translate ?\C-i ?\C-p)

(define-key xah-fly-insert-map (kbd "C-p") 'previous-line)
(define-key xah-fly-insert-map (kbd "C-k") 'next-line)
(define-key xah-fly-insert-map (kbd "C-j") 'left-char)
(define-key xah-fly-insert-map (kbd "C-l") 'right-char)

;;Ideally we want all our key bindings to have a seperate entry point
;;something like C-j or something, TODO this

;;open the buffer menu from command mode
