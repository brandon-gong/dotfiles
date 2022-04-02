(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-color-icons t)
 '(all-the-icons-scale-factor 1)
 '(company-tooltip-width-grow-only t)
 '(custom-safe-themes
	 '("ed68393e901a88b9feefea1abfa9a9c5983e166e4378c71bb92e636423bd94fd" default))
 '(dired-sidebar-cycle-subtree-on-click t)
 '(dired-sidebar-theme 'icons)
 '(dired-sidebar-use-custom-font t)
 '(dired-sidebar-width 40)
 '(package-selected-packages
	 '(telephone-line company magit all-the-icons-dired all-the-icons dired-sidebar use-package tuareg projectile ivy smartparens org-bullets smart-mode-line dashboard which-key atom-one-dark-theme undo-tree evil))
 '(tab-line-close-button-show nil)
 '(tab-line-exclude-modes
	 '(completion-list-mode term-mode dired-sidebar-mode dired-mode))
 '(tab-line-new-button-show nil)
 '(telephone-line-height 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "#313640" :foreground "#ABB2BF"))))
 '(company-tooltip-common ((t (:background "#313640" :foreground "#61afef"))))
 '(company-tooltip-common-selection ((t (:background "#4b5263" :foreground "#61afef"))))
 '(company-tooltip-mouse ((t (:background "#4b5263"))))
 '(company-tooltip-scrollbar-thumb ((t (:background "#4b5263"))))
 '(company-tooltip-scrollbar-track ((t (:background "#313640"))))
 '(company-tooltip-selection ((t (:background "#4b5263" :foreground "#ABB2BF"))))
 '(tab-line ((t (:background "#313540" :foreground "#ABB2BF" :box nil :height 1.0 :width expanded :family "Fira Code"))))
 '(tab-line-tab ((t (:inherit tab-line :box nil :width expanded))))
 '(tab-line-tab-current ((t (:inherit tab-line-tab :background "#4b5263" :foreground "#abb2bf"))))
 '(tab-line-tab-inactive ((t (:inherit tab-line-tab :background "#3d424f" :foreground "#5c6370"))))
 '(telephone-line-accent-active ((t (:inherit nil :background "grey22" :foreground "white"))))
 '(telephone-line-accent-inactive ((t (:inherit nil :background "#2e323c" :foreground "white"))))
 '(telephone-line-evil ((t (:inherit nil :foreground "#282c34" :weight normal))))
 '(telephone-line-evil-emacs ((t (:inherit telephone-line-evil :background "#c678dd"))))
 '(telephone-line-evil-god ((t (:inherit telephone-line-evil :background "#56b6c2"))))
 '(telephone-line-evil-insert ((t (:inherit telephone-line-evil :background "#98c379"))))
 '(telephone-line-evil-motion ((t (:inherit telephone-line-evil :background "#61afef"))))
 '(telephone-line-evil-normal ((t (:inherit telephone-line-evil :background "#e06c75"))))
 '(telephone-line-evil-operator ((t (:inherit telephone-line-evil :background "#c678dd"))))
 '(telephone-line-evil-replace ((t (:inherit telephone-line-evil :background "#c678dd"))))
 '(telephone-line-evil-visual ((t (:inherit telephone-line-evil :background "#d19a66"))))
 '(telephone-line-unimportant ((t (:inherit nil :foreground "dim grey"))))
 '(term-color-black ((t (:foreground "#4B5263" :background "#282C34"))))
 '(term-color-blue ((t (:foreground "#61AFEF" :background "#61AFEF"))))
 '(term-color-cyan ((t (:foreground "#56B6C2" :background "#56B6C2"))))
 '(term-color-green ((t (:foreground "#98C379" :background "#98C379"))))
 '(term-color-magenta ((t (:foreground "#C678DD" :background "#C678DD"))))
 '(term-color-red ((t (:foreground "#E06C75" :background "#BE5046"))))
 '(term-color-white ((t (:foreground "#ABB2BF" :background "#5C6370"))))
 '(term-color-yellow ((t (:foreground "#E5C07B" :background "#D19A66"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-white)))))


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(set-frame-font "Fira Code 14" nil t)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(evil-ex-define-cmd "q" 'kill-this-buffer)
(evil-ex-define-cmd "quit" 'evil-quit)
(evil-define-command evil-write-and-kill-buffer (path)
  "Save and kill buffer."
  :repeat nil
  :move-point nil
  (interactive "<f>")
  (if (zerop (length path))
      (save-buffer)
    (write-file path))
  (kill-buffer (current-buffer)))
(evil-ex-define-cmd "wq" 'evil-write-and-kill-buffer)

;;(require 'undo-tree)
;;(global-undo-tree-mode)
(global-unset-key (kbd "C-z"))

(load-theme 'atom-one-dark t)

(transient-mark-mode 1)
(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq org-agenda-window-setup 'only-window)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq tex-fontify-script nil)
(setq font-latex-fontify-script nil)

(require 'which-key)
(which-key-setup-side-window-bottom)
(setq which-key-show-early-on-C-h t)
(setq which-key-idle-delay 0.05)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)

;;(setq sml/theme 'atom-one-dark)
;;(sml/setup)

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(setq dashboard-banner-logo-title "Hello, Brandon.")
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)

(require 'smartparens-config)
(with-eval-after-load 'smartparens
	(sp-with-modes
			'(c++-mode objc-mode c-mode)
		(sp-local-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET")))))
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'latex-mode-hook #'smartparens-mode)
(add-hook 'c-mode-common-hook #'smartparens-mode)

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
;;(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

;; just use fish
(defun fish ()
  (interactive)
  (term "/opt/homebrew/bin/fish"))

(global-hl-line-mode 1)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "  ")
 ;; (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
	;; (setq dired-sidebar-use-custom-font t)
	)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(require 'whitespace)
;; make whitespace-mode use just basic coloring
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
(set-face-attribute 'whitespace-space nil :background nil :foreground "#5C6370")
(setq whitespace-display-mappings
       ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [8629 10]) ; 10 LINE FEED
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))

(desktop-save-mode 1)

(global-tab-line-mode)
(defun tab-line-close-tab (&optional e)
  "Close the selected tab.
If tab is presented in another window, close the tab by using `bury-buffer` function.
If tab is uniq to all existing windows, kill the buffer with `kill-buffer` function.
Lastly, if no tabs left in the window, it is deleted with `delete-window` function."
  (interactive "e")
  (let* ((posnp (event-start e))
         (window (posn-window posnp))
         (buffer (get-pos-property 1 'tab (car (posn-string posnp)))))
    (with-selected-window window
      (let ((tab-list (tab-line-tabs-window-buffers))
            (buffer-list (flatten-list
                          (seq-reduce (lambda (list window)
                                        (select-window window t)
                                        (cons (tab-line-tabs-window-buffers) list))
                                      (window-list) nil))))
        (select-window window)
        (if (> (seq-count (lambda (b) (eq b buffer)) buffer-list) 1)
            (progn
              (if (eq buffer (current-buffer))
                  (bury-buffer)
                (set-window-prev-buffers window (assq-delete-all buffer (window-prev-buffers)))
                (set-window-next-buffers window (delq buffer (window-next-buffers))))
              (unless (cdr tab-list)
                (ignore-errors (delete-window window))))
          (and (kill-buffer buffer)
               (unless (cdr tab-list)
                 (ignore-errors (delete-window window)))))))
    (force-mode-line-update)))

(setq tab-line-separator "")
(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))
(defun my/tab-line-tab-name-buffer (buffer &optional _buffers)
  (format " %s " (buffer-name buffer)))
(setq tab-line-tab-name-function #'my/tab-line-tab-name-buffer)

(add-hook 'after-init-hook 'global-company-mode)

(require 'telephone-line)
(setq telephone-line-primary-left-separator 'telephone-line-flat
      telephone-line-secondary-left-separator 'telephone-line-flat
      telephone-line-primary-right-separator 'telephone-line-flat
      telephone-line-secondary-right-separator 'telephone-line-flat)
(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-airline-position-segment))))
(telephone-line-mode 1)

(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if
  ;; neither, we use the current indent-tabs-mode
  (let ((space-count (how-many-region (point-min) (point-max) "^  "))
                (tab-count (how-many-region (point-min) (point-max) "^\t")))
        (if (> space-count tab-count) (setq indent-tabs-mode nil))
        (if (> tab-count space-count) (setq indent-tabs-mode t))))

(add-hook 'c-mode-common-hook 'infer-indentation-style)

;; remove later
(setq-default indent-tabs-mode nil)

