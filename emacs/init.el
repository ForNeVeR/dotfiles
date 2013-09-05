(require 'cl)

(server-start)

(setq my-packages '(batch-mode gruber-darker-theme multiple-cursors paredit powershell))
(loop for p in my-packages
      when (not (package-installed-p p))
      do (package-install p))

(add-to-list 'process-coding-system-alist
             '("powershell.exe" . (cp866-dos . cp866-dos)))

;; Automatically save and restore sessions:
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil)
(desktop-save-mode 1)
(desktop-read)

;; Fix the shift-selection broken by the starter kit:
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<right>"))
(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<down>"))
(setq shift-select-mode t)

;; linum-mode:
(global-linum-mode 1)

;; powershell-mode
(let ((current-directory (file-name-directory load-file-name)))
  (add-to-list 'load-path current-directory))
(load "PowerShell-Mode.el")
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.cmd\\'" . batch-mode))
(add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode))

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-C-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-C-<down>") 'mc/mark-next-like-this)

(load-theme 'gruber-darker)
(setq default-file-name-coding-system 'cp1251)
(setq file-name-coding-system 'cp1251)

(setq-default indent-tabs-mode t)
(setq default-tab-width 4)

(tool-bar-mode -1)
(menu-bar-mode -1)
