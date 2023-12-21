(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons--cache-limit 4096)
 '(all-the-icons-alltheicon-scale-factor 1.0)
 '(all-the-icons-default-adjust -0.4)
 '(all-the-icons-scale-factor 1.0)
 '(auth-sources
   '("/home/psi/.emacs.d/.local/state/authinfo.gpg" "~/.authinfo.gpg" "~/.authinfo"))
 '(bidi-paragraph-direction 'left-to-right)
 '(byte-compile-docstring-max-column 120)
 '(byte-compile-verbose nil)
 '(centaur-tabs-gray-out-icons t)
 '(cider-auto-jump-to-error nil)
 '(cider-auto-select-error-buffer nil)
 '(cider-jack-in-default 'clojure-cli)
 '(cider-repl-use-content-types t)
 '(cider-show-error-buffer 'except-in-repl)
 '(column-number-mode t)
 '(context-menu-mode t)
 '(custom-safe-themes
   '("34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec"
     "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1"
     "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c"
     "9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392"
     "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
     "badd1a5e20bd0c29f4fe863f3b480992c65ef1fa63951f59aa5d6b129a3f9c4c"
     "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e"
     "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0"
     "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426"
     "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee"
     "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b"
     "29b4f767c48da68f8f3c2bbf0dde2be58e4ed9c97e685af5a7ab7844f0d08b8b"
     "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33"
     "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039"
     "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a"
     "3cdd0a96236a9db4e903c01cb45c0c111eb1492313a65790adb894f9f1a33b2d"
     "9dccdccfeb236623d5c7cf0250a92308cf307afde4ebdaf173b59e8bbbae1828"
     "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874"
     "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561"
     "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" default))
 '(doom-modeline-major-mode-icon t)
 '(doom-themes-padded-modeline t)
 '(eldoc-box-only-multi-line t)
 '(eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
 '(eldoc-echo-area-use-multiline-p nil)
 '(forge-topic-list-limit '(60 . -10))
 '(global-prettify-symbols-mode t)
 '(image-use-external-converter t)
 '(ls-lisp-use-insert-directory-program t)
 '(lsp-eldoc-render-all t)
 '(lsp-enable-indentation nil)
 '(lsp-file-watch-threshold 10000)
 '(lsp-headerline-breadcrumb-enable t)
 '(lsp-headerline-breadcrumb-enable-diagnostics nil)
 '(lsp-keep-workspace-alive nil)
 '(lsp-rust-analyzer-cargo-watch-command "clippy")
 '(lsp-rust-analyzer-display-chaining-hints t)
 '(lsp-rust-analyzer-display-closure-return-type-hints t)
 '(lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
 '(lsp-rust-analyzer-server-display-inlay-hints t)
 '(lsp-tailwindcss-add-on-mode t)
 '(lsp-treemacs-sync-mode t)
 '(lsp-ui-doc-border "slate gray")
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-doc-max-height 20)
 '(lsp-ui-doc-max-width 100)
 '(lsp-ui-doc-show-with-mouse t)
 '(lsp-ui-doc-use-webkit t)
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(mouse-1-click-follows-link 'double)
 '(package-selected-packages '(centaur-tabs extempore-mode good-scroll restclient))
 '(persp-emacsclient-init-frame-behaviour-override
   '(lambda (frame &optional new-frame-p) (persp-switch "main" frame)
      (unless (doom-real-buffer-p (current-buffer))
        (switch-to-buffer (doom-fallback-buffer)))) nil nil "+workspaces-associate-frame-fn")
 '(pixel-scroll-precision-interpolate-page t)
 '(recentf-auto-cleanup 'mode)
 '(size-indication-mode t)
 '(tab-bar-auto-width-max '(350 20))
 '(tab-bar-mode nil)
 '(tab-bar-tab-name-truncated-max 30)
 '(tab-line-exclude-modes
   '(completion-list-mode special-mode treemacs-mode vterm-mode helpful-mode
     woman-mode))
 '(tab-line-tabs-function
   '(lambda nil
      (remove-if (lambda (x) (string-match "\\(GameOfLife\\)" (buffer-name x)))
                 (tab-line-tabs-window-buffers))))
 '(tool-bar-mode nil)
 '(tooltip-delay 0.5)
 '(tooltip-reuse-hidden-frame nil)
 '(treemacs-eldoc-display 'detailed)
 '(treemacs-follow-mode t)
 '(treemacs-indent-guide-mode t)
 '(treemacs-indentation 3)
 '(treemacs-show-cursor t)
 '(treemacs-width 28)
 '(treemacs-window-background-color '("#1f1720" . "#45395b"))
 '(use-package-always-demand nil)
 '(warning-minimum-level :emergency)
 '(warning-suppress-types '((comp)))
 '(yas-global-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :background "#34323e" :foreground "#4f97d7" :underline nil :weight bold))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground "#4f97d7" :underline nil :weight bold))))
 '(eldoc-box-border ((t (:background "slate gray"))))
 '(error ((t (:foreground "#e67f43" :family "Source Code Pro"))))
 '(fixed-pitch ((t (:family "FiraCode Nerd Font" :height 180))))
 '(font-lock-comment-face ((t (:inherit variable-pitch :foreground "#2aa1ae" :slant italic :height 0.9 :family "iMWritingDuo Nerd Font propo"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#83898d" :height 1.1))))
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
 '(line-number ((t (:inherit default :background "#1f2033" :foreground "#4E8776" :slant italic :weight light :family "JetBrainsMonoNL Nerd Font"))))
 '(lsp-headerline-breadcrumb-path-face ((t (:inherit font-lock-string-face :height 1.05))))
 '(lsp-headerline-breadcrumb-symbols-face ((t (:inherit font-lock-doc-face :weight bold))))
 '(lsp-ui-doc-highlight-hover ((t (:background "dark slate gray"))))
 '(minibuffer-header-face ((t (:extend t :background "DarkSeaGreen1" :foreground "gray10"))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT" :height 2.0 :underline nil))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "unspecified-fg" :font "ETBookOT"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))))
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:foreground "#83a598" :family "iMWritingQuat Nerd Font Prop"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(spaceline-read-only ((t (:background "plum3" :foreground "systembackground" :inherit 'mode-line))))
 '(tab-line ((t (:foreground "#2e2f46" :box nil :weight regular :height 110 :family "NotoSans Nerd Font"))))
 '(tab-line-highlight ((t (:weight heavy :box (:line-width (10 . 4) :style released-button) :foreground "gainsboro" :background "#2e2f46" :inherit tab-line))))
 '(tab-line-tab ((t (:weight semi-bold :box (:line-width (10 . 4) :style released-button) :foreground "gainsboro" :background "#2e2f46" :inherit tab-line))))
 '(tab-line-tab-current ((t (:foreground "#bbc2cf" :background "#2e2f46" :inherit tab-line-tab))))
 '(tab-line-tab-inactive ((t (:weight medium :box (:line-width (10 . 4) :style flat-button) :foreground "dark gray" :background "#2e2f46" :inherit tab-line))))
 '(tab-line-tab-special ((t (:weight bold :box (:line-width (10 . 4) :style flat-button) :foreground "dark gray" :background "#2e2f46" :inherit tab-line))))
 '(tooltip ((t (:background "#4b4062" :foreground "#b2b2b2" :underline nil :slant normal :weight normal :height 1.0))))
 '(treemacs-git-unmodified-face ((t (:inherit treemacs-file-face :height 1.0))))
 '(treemacs-window-background-face ((t (:background "#242530"))))
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light))))
 '(variable-pitch ((t (:slant normal :weight regular :height 110 :width normal :foundry "1ASC" :family "LiterationSans Nerd Font")))))
(put 'customize-group 'disabled nil)
(put 'customize-variable 'disabled nil)
(put 'customize-face 'disabled nil)
(put 'customize-themes 'disabled nil)
