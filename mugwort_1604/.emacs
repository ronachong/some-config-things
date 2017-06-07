;; ln -s ~/projects/all-configuration-things/mugwort_1604/.emacs ~/.emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -----the following has been added by me:
;; ---by suggestion from github.com/holbertonschool/Betty/wiki/Tools:-Emacs
;; use tabs for indents; display as 8 spaces
(setq c-default-style "bsd"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)

;; highlight chars exceeding 80 chars & trailing whitespace
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
;; (global-whitepace-mode t)

;; display col num next to row
(setq column-number-mode t)
