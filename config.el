;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;;;; Core

;(setq doom-incremental-packages nil)

; Async Comp
(defconst dd/using-native-comp (and (fboundp 'native-comp-available-p)
                                      (native-comp-available-p)))
(setq native-comp-async-query-on-exit t)
(setq native-comp-async-report-warnings-errors nil)

; LSP P-lists
(setenv "LSP_USE_PLISTS" "1")
(setq-default lsp-use-plists t)

; GC only on idle
(after! gcmh
  (setq! gcmh-idle-delay 10
         gcmh-high-cons-threshold 104857600)
  (gcmh-mode t))

; Local modules
(let ((default-directory "~/.doom.d/elp"))
    (normal-top-level-add-subdirs-to-load-path))


;;;; UI

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18))
(setq doom-variable-pitch-font (font-spec :family "Source Sans Variable" :size 20))

(menu-bar-mode 0)
(blink-cursor-mode 1)
(pixel-scroll-precision-mode 1)

; Multiple scrollbars
(defun update-scroll-bars ()
  (interactive)
  (mapc (lambda (win)
          (set-window-scroll-bars win nil))
        (window-list))
  (set-window-scroll-bars (selected-window) 10 'right))

(add-hook 'window-configuration-change-hook #'update-scroll-bars)
(add-hook 'buffer-list-update-hook #'update-scroll-bars)

(+global-word-wrap-mode)

; DOOM greeting
(setq +doom-dashboard-ascii-banner-fn
      (lambda ()
        (let* ((banner '(" "
                         "EMACS"
                         " "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner))))

; Modeline
(setq doom-modeline-battery nil
      doom-modeline-buffer-modification-icon nil
      doom-modeline-github t
      doom-modeline-hud t
      doom-modeline-major-mode-icon t
      doom-modeline-major-mode-color-icon t
      doom-modeline-lsp-icon t
      doom-modeline-total-line-number t
      doom-modeline-time nil
      doom-modeline-time-icon nil
      doom-modeline-unicode-fallback t
      doom-modeline-workspace-name nil
      doom-modeline-height 32
      doom-modeline-icon t)

;;;; Config

(setq straight-vc-git-default-clone-depth 1)

(add-hook 'Info-selection-hook 'info-colors-fontify-node)

;; Speed up fonts
(setq-default inhibit-compacting-font-caches t)
(setq-default bidi-inhibit-bpa t)

; Forge auth
;(setq auth-sources '("~/.authinfo.gpg"))

;;;; Prog

;;(add-hook 'lsp-mode-hook #'eldoc-box-hover-mode)

(setq treesit-extra-load-path '("~/.doom.d/elp/tree-sitter-module/dist"))

(add-hook 'company-completion-started-hook
            #'(lambda (&rest _)
              (setq-local lsp-inhibit-lsp-hooks t)
              (lsp--capf-clear-cache))
            nil
            t)

(add-hook 'c-ts-mode-hook 'lsp)
(remove-hook 'c-ts-mode-hook 'tree-sitter-mode)

(after! lsp-ui (setq lsp-ui-doc-show-with-mouse t
                     lsp-ui-doc-use-webkit t
                     lsp-ui-doc-max-height 16))

;;;; Bindings

(evil-define-key '(normal insert visual motion emacs) 'global [mouse-4] #'previous-buffer)
(evil-define-key '(normal insert visual motion emacs) 'global [mouse-5] #'next-buffer)
(evil-define-key '(normal insert visual motion emacs) 'global (kbd "<C-left>") #'previous-buffer)
(evil-define-key '(normal insert visual motion emacs) 'global (kbd "<C-right>") #'next-buffer)
(evil-define-key '(normal insert visual emacs) dired-mode-map [mouse-1] #'dired-find-file)
(evil-define-key '(normal insert visual motion emacs) 'global (kbd "M-<f1>") #'tab-line-mode)
(evil-define-key '(normal insert visual motion emacs) 'global (kbd "M-<f2>") #'treemacs-add-and-display-current-project-exclusively)
(evil-define-key '(normal insert visual motion emacs) 'global (kbd "M-<f3>") #'global-tab-line-mode)
(evil-define-key '(visual) 'global (kbd "C-\\") #'comment-region)
(evil-define-key '(visual) 'global (kbd "C-|") #'uncomment-region)

(map! :leader
      "SPC" #'execute-extended-command)

(map! :map evil-window-map
      "/" #'split-window-horizontally
      "-" #'split-window-vertically)

(map! :map with-editor-mode-map
      :n ", c" #'with-editor-finish
      :n ", k" #'with-editor-cancel)

(map! :leader
      "b b" #'switch-to-buffer
      "b B" #'+vertico/switch-workspace-buffer)

(map! :after evil
      :nig "<mouse-2>" 'ignore)

;;;; Org

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package! org-bullets
   :config
   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(let* ((variable-tuple
          '(:font "ETBookOT"))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "Source Sans Variable" :height 120))))
   '(fixed-pitch ((t ( :family "FiraCode Nerd Font" :height 180)))))

(add-hook 'org-mode-hook 'visual-line-mode)

(custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:foreground "#83a598" :family "iMWritingQuat Nerd Font Prop"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(add-hook 'org-mode-hook 'mixed-pitch-mode)

;;;; Icons and Tabs

(use-package! all-the-icons-nerd-fonts
  :after all-the-icons
  :demand t
  :config
  (all-the-icons-nerd-fonts-prefer))

(after! centaur-tabs
  (setq centaur-tabs-style "bar"
         centaur-tabs-height 38
         centaur-tabs-set-icons t
         centaur-tabs-show-new-tab-button t
         centaur-tabs-set-modified-marker t
         centaur-tabs-set-bar 'left
         centaur-tabs-show-count nil
         x-underline-at-descent-line t
         centaur-tabs-left-edge-margin nil
         centaur-tabs-gray-out-icons t
         ;centaur-tabs-plain-icons nil
         )
  (centaur-tabs-change-fonts (face-attribute 'default :font) 115)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  )

(add-hook 'server-after-make-frame-hook #'(lambda () (require 'centaur-tabs)))

(after! doom-themes
  (doom-themes-treemacs-config)
  (setq doom-themes-treemacs-theme "doom-colors"))

;;;; Modes

(after! gameoflife
  (setq! gameoflife-screensaver-timeout 180
         gameoflife-animation-speed 0.5)
  (add-hook 'server-after-make-frame-hook #'(lambda () (gameoflife-screensaver-mode 1))))


;;;; Ligatures

(after! ligature
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia and Fira Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode
                        '(;; == === ==== => =| =>>=>=|=>==>> ==< =/=//=// =~
                          ;; =:= =!=
                          ("=" (rx (+ (or ">" "<" "|" "/" "~" ":" "!" "="))))
                          ;; ;; ;;;
                          (";" (rx (+ ";")))
                          ;; && &&&
                          ("&" (rx (+ "&")))
                          ;; !! !!! !. !: !!. != !== !~
                          ("!" (rx (+ (or "=" "!" "\." ":" "~"))))
                          ;; ?? ??? ?:  ?=  ?.
                          ("?" (rx (or ":" "=" "\." (+ "?"))))
                          ;; %% %%%
                          ("%" (rx (+ "%")))
                          ;; |> ||> |||> ||||> |] |} || ||| |-> ||-||
                          ;; |->>-||-<<-| |- |== ||=||
                          ;; |==>>==<<==<=>==//==/=!==:===>
                          ("|" (rx (+ (or ">" "<" "|" "/" ":" "!" "}" "\]"
                                          "-" "=" ))))
                          ;; \\ \\\ \/
                          ("\\" (rx (or "/" (+ "\\"))))
                          ;; ++ +++ ++++ +>
                          ("+" (rx (or ">" (+ "+"))))
                          ;; :: ::: :::: :> :< := :// ::=
                          (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
                          ;; // /// //// /\ /* /> /===:===!=//===>>==>==/
                          ("/" (rx (+ (or ">"  "<" "|" "/" "\\" "\*" ":" "!"
                                          "="))))
                          ;; .. ... .... .= .- .? ..= ..<
                          ("\." (rx (or "=" "-" "\?" "\.=" "\.<" (+ "\."))))
                          ;; -- --- ---- -~ -> ->> -| -|->-->>->--<<-|
                          ("-" (rx (+ (or ">" "<" "|" "~" "-"))))
                          ;; *> */ *)  ** *** ****
                          ("*" (rx (or ">" "/" ")" (+ "*"))))
                          ;; www wwww
                          ("w" (rx (+ "w")))
                          ;; <> <!-- <|> <: <~ <~> <~~ <+ <* <$ </  <+> <*>
                          ;; <$> </> <|  <||  <||| <|||| <- <-| <-<<-|-> <->>
                          ;; <<-> <= <=> <<==<<==>=|=>==/==//=!==:=>
                          ;; << <<< <<<<
                          ("<" (rx (+ (or "\+" "\*" "\$" "<" ">" ":" "~"  "!"
                                          "-"  "/" "|" "="))))
                          ;; >: >- >>- >--|-> >>-|-> >= >== >>== >=|=:=>>
                          ;; >> >>> >>>>
                          (">" (rx (+ (or ">" "<" "|" "/" ":" "=" "-"))))
                          ;; #: #= #! #( #? #[ #{ #_ #_( ## ### #####
                          ("#" (rx (or ":" "=" "!" "(" "\?" "\[" "{" "_(" "_"
                                       (+ "#"))))
                          ;; ~~ ~~~ ~=  ~-  ~@ ~> ~~>
                          ("~" (rx (or ">" "=" "-" "@" "~>" (+ "~"))))
                          ;; __ ___ ____ _|_ __|____|_
                          ("_" (rx (+ (or "_" "|"))))
                          ;; Fira code: 0xFF 0x12
                          ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
                          ;; Fira code:
                          "Fl"  "Tl"  "fi"  "fj"  "fl"  "ft"
                          ;; The few not covered by the regexps.
                          "{|"  "[|"  "]#"  "(*"  "}#"  "$>"  "^="))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
