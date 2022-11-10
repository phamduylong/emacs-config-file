;; Stop startup screen
(setq inhibit-splash-screen t)

;; Max screen window size
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;;disable menu on start
(menu-bar-mode -1)

;; disable scroll bar on start
(scroll-bar-mode -1)

;; set GNU indentation
(setq c-default-style "linux"
      c-basic-offset 4)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(which-key try use-package yasnippet-classic-snippets yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'yasnippet)
(yas-global-mode 1)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))

(defun code-compile ()
  (interactive)
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
     (let ((file (file-name-nondirectory buffer-file-name)))
       (format "%s -o %s %s"
           (if  (equal (file-name-extension file) "cpp") "g++" "gcc" )
           (file-name-sans-extension file)
           file)))
    (compile compile-command)))

(global-set-key [f9] 'code-compile)

(use-package auto-complete
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package modern-cpp-font-lock
  :ensure t)

(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)))


