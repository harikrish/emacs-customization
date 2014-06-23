(when (or (eq system-type 'windows-nt) (eq system-type 'msdos))
      (setenv "PATH" (concat "C:\\UnxUtils\\usr\\local\\wbin;" (getenv "PATH")))
      (setq find-program "C:\\UnxUtils\\usr\\local\\wbin\\find.exe"))



 (defadvice shell-quote-argument (after windows-nt-special-quote (argument) activate)
     "Add special quotes to ARGUMENT in case the system type is 'windows-nt."
     (when
         (and (eq system-type 'windows-nt) (w32-shell-dos-semantics))
       (if (string-match "[\\.~]" ad-return-value)
           (setq ad-return-value
	        (replace-regexp-in-string
	         "\\([\\.~]\\)"
	         "\\\\\\1"
	         ad-return-value)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New")))))

(add-to-list 'load-path "~/Documents/emacs-plugins/flymake-node-jshint-master")
(require 'flymake-node-jshint)
(setq flymake-node-jshint-config "C:/Documents/emacs-plugins/.jshintrc")
  (add-hook 'js-mode-hook (lambda () (flymake-mode 1)))

;; Turns on flymake for all files which have a flymake mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(setq url-proxy-services '(("no_proxy" . "work\\.com")
                           ("http" . "proxy.acme.com:8080")))



(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

(setq-default indent-tabs-mode nil)

(require 'flymake-csslint)

(setq show-paren-delay 0)
(show-paren-mode 1)

(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks) ;;disable flymake for html
(delete '("\\.xml?\\'" flymake-xml-init) flymake-allowed-file-name-masks) ;;disable flymake for html


(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 
