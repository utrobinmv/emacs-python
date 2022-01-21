;; .emacs.d/init.el

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))
  
;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    python-mode                     ;; python-mode
    markdown-mode                   ;; markdown-mode
    material-theme                  ;; Theme
    ein                             ;; EIN Python Jupyter Notebook Run
    )
  )

;;add handup go-translate-v1
(add-to-list 'load-path "~/.emacs.d/go-translate")
(require 'go-translate-v1)

(setq go-translate-local-language "en")
(setq go-translate-target-language "ru")

(global-set-key "\C-ct" 'go-translate)
(global-set-key "\C-cT" 'go-translate-popup)

(setq go-translate-token-current (cons 430675 2721866130))

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)
      
;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally


;;My add python-mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; plugin jfmenu
(load-file "~/.emacs.d/jfmenu.el")


;;jf settings
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving


;;eww для ссылок под курсором
(global-set-key (kbd "C-x m") 'browse-url-at-point)

;;Говорит что сайт github открывать во внешнем браузере все остальные ссылки во внутреннем
(setq browse-url-browser-function
    '((".*google.*maps.*" . browse-url-generic)
      ;; Github goes to firefox, but not gist
      ("http.*\/\/github.com" . browse-url-generic)
      ("." . eww-browse-url)))
(setq browse-url-generic-program (executable-find "flashpeak-slimjet"))      

;удобный скроллинг и выделение текущей строки. по умолчанию emacs прокручивает почти на половину экрана, что крайне не удобно. исправим это. и еще бывает что теряешь место курсора, для этого включаем подсветку текущей строки.
(setq scroll-step 1)
;(global-hl-line-mode 1)

;; User-Defined init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
