;;; Ruby

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/ruby"))
(require 'ruby-mode)
;; (require 'ruby-electric)
(require 'inf-ruby)

(autoload 'xmp "rcodetools" nil t)

;; Run the current ruby buffer
(defun ruby-eval-buffer ()
   "Evaluate the buffer with ruby."
   (interactive)
   (shell-command-on-region (point-min) (point-max) "/opt/local/bin/ruby"))

;; Local key bindings
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key [(control f1)]      'ruby-eval-buffer)
            (local-set-key [(control meta f1)] 'xmp)
            ))

(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("autotest$" . ruby-mode))
(add-to-list 'auto-mode-alist '("irbrc$" . ruby-mode))
(add-to-list 'auto-mode-alist '("sake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("god$" . ruby-mode))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/ri-emacs"))
(setq ri-ruby-script (expand-file-name "~/.emacs.d/vendor/ri-emacs/ri-emacs.rb"))
(autoload 'ri "ri-ruby" nil t)
(add-hook 'ruby-mode-hook
          (lambda ()
            (ruby-electric-mode)
            (local-set-key [(f1)] 'ri)
;;             (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
            (local-set-key [(meta f1)] 'ri-ruby-show-args)
            ))


(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/yaml-mode"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
