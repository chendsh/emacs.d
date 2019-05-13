(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-blinks 0)
 '(custom-enabled-themes (quote (wombat)))
 '(initial-frame-alist (quote ((height . 50) (width . 168))))
 '(package-selected-packages (quote (haskell-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "bisque4" :foreground "white smoke")))))
(put 'narrow-to-region 'disabled nil)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos")
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match nil)
(set-face-bold-p 'show-paren-match t)
(set-face-italic-p 'show-paren-match t)
(set-face-underline-p 'show-paren-match t)
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
(define-key global-map (kbd "C-;") 'other-window)
(column-number-mode t)
(display-battery-mode t)
(global-linum-mode t)
(setq frame-title-format "%f")
(set-face-background 'region "dark-green")
(global-hl-line-mode t)

(require 'package)
(add-to-list
 'package-archives
;; '("melpa-stable" . "https://stable.melpa.org/packages/")
 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;;(add-hook 'after-init-hook #'global-flycheck-mode)
;;(setq flycheck-global-modes '(haskell-mode java-mode js-mode emacs-lisp-mode lisp-mode lisp-interaction-mode))
;; haskell-mode
(autoload 'haskell-mode "haskell-mode")
(autoload 'haskell-cabal "haskell-cabal")
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
;;(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
;;(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
;;;(setq haskell-program-name "ghci")
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;;org-mode
(add-hook 'org-mode-hook
	  '(lambda ()
	     (linum-mode 0)))

