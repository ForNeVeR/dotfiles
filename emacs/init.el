(require 'cl)
(require 'package)

(server-start)

;(add-to-list 'package-archives
;  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq my-packages '(batch-mode
					graphviz-dot-mode
					gruber-darker-theme
					haskell-mode
					multiple-cursors
					paredit
					powershell
					rust-mode))
(loop for p in my-packages
      when (not (package-installed-p p))
      do (package-install p))

(add-to-list 'process-coding-system-alist
             '("powershell.exe" . (cp866-dos . cp866-dos)))

;; Fix the shift-selection broken by the starter kit:
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<right>"))
(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<down>"))
(setq shift-select-mode t)

;; Fix the auto-fill-mode starting in the starter kit:
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; linum-mode:
(global-linum-mode 1)

;; powershell-mode
(let ((current-directory (file-name-directory load-file-name)))
  (add-to-list 'load-path current-directory))
(load "PowerShell-Mode.el")
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.psm1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.cmd\\'" . batch-mode))
(add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode))

;; proof general
(load "ProofGeneral-4.2/generic/proof-site.el")

;; SLIME
(add-to-list 'load-path (concat (file-name-directory load-file-name) "slime-2.9"))
(load "slime-2.9/slime-autoloads.el")

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-C-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-C-<down>") 'mc/mark-next-like-this)

;; cua-mode
(cua-mode)

;; Theme and menus:
(load-theme 'gruber-darker t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Global editor settings:
(setq default-file-name-coding-system 'cp1251)
(setq file-name-coding-system 'cp1251)

(setq-default indent-tabs-mode t)
(setq default-tab-width 4)
