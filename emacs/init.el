(require 'cl)

(server-start)

(setq my-packages '(multiple-cursors paredit powershell))
(loop for p in my-packages
      when (not (package-installed-p p))
      do (package-install p))

(add-to-list 'process-coding-system-alist
             '("powershell.exe" . (cp866-dos . cp866-dos)))

;; linum-mode:
(global-linum-mode 1)

;; powershell-mode
(let ((current-directory (file-name-directory load-file-name)))
  (add-to-list 'load-path current-directory))
(load "PowerShell-Mode.el")
(add-to-list 'auto-mode-alist '("\\.ps1" . powershell-mode))

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-C-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-C-<down>") 'mc/mark-next-like-this)

(load-theme 'tsdh-dark)
(setq default-file-name-coding-system 'cp1251)
(setq file-name-coding-system 'cp1251)

(setq-default indent-tabs-mode t)
(setq default-tab-width 4)

(tool-bar-mode -1)
(menu-bar-mode -1)
