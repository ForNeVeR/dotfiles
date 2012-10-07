;; Enable line numbers:
(global-linum-mode 1)

;; Manage elisp packages:
(add-to-list 'load-path "~/.emacs.d")

;; Start powershell-mode package:
(load-library "PowerShell-Mode")

;; Start emacs server:
(server-start)
