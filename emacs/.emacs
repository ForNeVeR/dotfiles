;; Manage elisp packages:
(add-to-list 'load-path "~/.emacs.d")

;; Enable line numbers:
(global-linum-mode 1)

;; Start powershell-mode package:
(load-library "PowerShell-Mode")

;; column-mode library:
(require 'column-marker)
; For enableing in foo-mode:
;(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))
;(global-set-key [?\C-c ?m] 'column-marker-1)

;; savehist-mode:
(setq savehist-additional-variables
  '(search-ring regexp-search-ring)
  savehist-file "~/.emacs.d/savehist")
(savehist-mode t)

;; Start emacs server:
(server-start)
