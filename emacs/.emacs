;; Manage elisp packages:
(add-to-list 'load-path "~/.emacs.d")

;; linum-mode:
(global-linum-mode 1)

;; powershell-mode:
(require 'powershell-mode)
(add-hook 'powershell-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width 4)))

;; column-mode:
(require 'column-marker)
; For enableing in foo-mode:
;(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))
;(global-set-key [?\C-c ?m] 'column-marker-1)

;; savehist-mode:
(setq savehist-additional-variables
  '(search-ring regexp-search-ring)
  savehist-file "~/.emacs.d/savehist")
(savehist-mode t)

;; Autoload:
(setq auto-mode-alist (cons '("\\.ps1$" . powershell-mode) auto-mode-alist))

;; Custom variables:
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(desktop-enable t nil (desktop))
  '(save-place t nil (saveplace)))

;; Start emacs server:
(server-start)
