(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-blinks 0)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(display-battery-mode t)
 '(fringe-mode (quote (0)) nil (fringe))
 '(initial-buffer-choice t)
 '(initial-frame-alist (quote ((height . 50) (width . 168))))
 '(linum-delay t)
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (dash s ag helm-ag-r)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "bisque4" :foreground "white smoke"))))
 '(region ((t (:background "dark-green" :foreground "navajo white" :box (:line-width 2 :color "grey75" :style released-button))))))
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
;(global-hl-line-mode t)
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.05 t 'global-hl-line-timer-function))
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
;;just to use external diff command
(add-to-list 'exec-path "C:/cygwin64/bin")
(add-to-list 'exec-path "C:/cygwin64/usr/local/bin")
(setq default-process-coding-system '(utf-8-dos . cp932))
(when (or (eq system-type 'windows-nt) (eq system-type 'msdos))
      (setenv "PATH" (concat "c:\\cygwin64\\bin;" (concat "c:\\cygwin64\\usr\\local\\bin;" (getenv "PATH"))))
      (setq find-program "C:/cygwin64/usr/bin/find.exe"
            grep-program "C:/cygwin64/usr/bin/grep.exe"))
					;(require 'ag)

(setq ag-highlight-search t)

;Alt+sでag実行
;(define-key global-map [(M s)] 'helm-ag)
;;org-mode
(add-hook 'org-mode-hook
	  '(lambda ()
	     (linum-mode 0)))
(add-hook 'eww-mode-hook
	  '(lambda ()
	     (linum-mode 0)))
 (org-babel-do-load-languages 'org-babel-load-languages '((js . t) (shell . t)))

