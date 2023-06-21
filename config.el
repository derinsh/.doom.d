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
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq doom-incremental-packages nil)
(defconst dd/using-native-comp (and (fboundp 'native-comp-available-p)
                                      (native-comp-available-p)))
(setq native-comp-async-query-on-exit t)
(setq native-comp-async-report-warnings-errors nil)

(setenv "LSP_USE_PLISTS" "1")
(setq-default lsp-use-plists t)

;;;; UI

(pixel-scroll-precision-mode 1)

(menu-bar-mode 0)
(blink-cursor-mode 1)

(defun update-scroll-bars ()
  (interactive)
  (mapc (lambda (win)
          (set-window-scroll-bars win nil))
        (window-list))
  (set-window-scroll-bars (selected-window) 10 'right))

(add-hook 'window-configuration-change-hook #'update-scroll-bars)
(add-hook 'buffer-list-update-hook #'update-scroll-bars)
(setq-default bidi-inhibit-bpa t)

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18))

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

(map! :map evil-window-map
      "/" #'split-window-horizontally
      "-" #'split-window-vertically)

;; (undefine-key! with-editor-mode-map
;;   ",")

(map! :map with-editor-mode-map
      :n ", c" #'with-editor-finish
      :n ", k" #'with-editor-cancel)

(map! :leader
      "b b" #'switch-to-buffer
      "b B" #'+vertico/switch-workspace-buffer)


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
