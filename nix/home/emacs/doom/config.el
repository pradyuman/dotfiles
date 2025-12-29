;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept.
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function.

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

;; ---------
;; Interface
;; ---------

(setq doom-theme 'pmn-zenbadger)
(setq display-line-numbers-type t)

(defun set-doom-font-by-monitor-resolution ()
  (let* ((attrs (frame-monitor-attributes))
         (geometry (alist-get 'geometry attrs))
         (width-pixels (nth 2 geometry))
         (font-size (if (> width-pixels 1920) 14 12)))
    (setq doom-font (font-spec :family "Hasklig" :size font-size))))

;; Set initial font size
(set-doom-font-by-monitor-resolution)

;; Reset font when window is focused
(add-function
 :after after-focus-change-function (lambda ()
                                      (set-doom-font-by-monitor-resolution)
                                      (doom/reload-font)))

(use-package! treemacs
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'deferred)
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;; --------------------
;; Programming Defaults
;; --------------------

(setq tab-width 2)

;; --------------
;; Language Tools
;; --------------

(use-package! treesit
  :config
  (dolist (mapping
           '(("\\.js\\'"  . typescript-ts-mode)
             ("\\.mjs\\'" . typescript-ts-mode)
             ("\\.mts\\'" . typescript-ts-mode)
             ("\\.cjs\\'" . typescript-ts-mode)
             ("\\.ts\\'"  . typescript-ts-mode)
             ("\\.jsx\\'" . tsx-ts-mode)
             ("\\.tsx\\'" . tsx-ts-mode)
             ("\\.json\\'" . json-ts-mode)
             ("\\.prisma\\'" . prisma-ts-mode)
             ("\\.yaml\\'" . yaml-ts-mode)
             ("\\Dockerfile\\'" . dockerfile-ts-mode)))
    (add-to-list 'auto-mode-alist mapping))

  (setq treesit-language-source-alist
        (append treesit-language-source-alist
                '((typespec "https://github.com/happenslol/tree-sitter-typespec"))))

  (dolist (mapping
           '((css-mode . css-ts-mode)
             (typescript-mode . typescript-ts-mode)
             (js-mode . typescript-ts-mode)
             (js2-mode . typescript-ts-mode)
             (json-mode . json-ts-mode)
             (js-json-mode . json-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))
  (setq treesit-font-lock-level 4))

(use-package! lsp-mode
  :hook (before-save . (lambda ()
                         (when (lsp-workspaces) (lsp-organize-imports))))
  :config
  (setq lsp-eslint-working-directories [(mode "auto")]))

(use-package! typescript-ts-mode
  :init
  (add-hook! '(typescript-ts-mode-hook tsx-ts-mode-hook) #'lsp-deferred)
  (after! flycheck
    (flycheck-add-mode 'javascript-eslint 'typescript-ts-mode)
    (flycheck-add-mode 'javascript-eslint 'tsx-ts-mode)
    (flycheck-add-mode 'typescript-tslint 'typescript-ts-mode)
    (flycheck-add-mode 'typescript-tslint 'tsx-ts-mode)))

(use-package! rainbow-mode
  :hook
  (typescript-ts-mode . rainbow-delimiters-mode)
  (tsx-ts-mode . rainbow-delimiters-mode))

;;; ---
;;; LLM
;;; ---

(use-package! minuet
  :bind
  (:map minuet-active-mode-map
        ;; These keymaps activate only when a minuet suggestion is displayed in the current buffer
        ("M-p" . #'minuet-previous-suggestion) ;; invoke completion or cycle to next completion
        ("M-n" . #'minuet-next-suggestion) ;; invoke completion or cycle to previous completion
        ("M-a" . #'minuet-accept-suggestion) ;; accept whole completion
        ;; Accept the first line of completion, or N lines with a numeric-prefix:
        ;; e.g. C-u 2 M-a will accepts 2 lines of completion.
        ("M-A" . #'minuet-accept-suggestion-line)

        ("M-e" . #'minuet-dismiss-suggestion))
  :init
  (add-hook 'prog-mode-hook #'minuet-auto-suggestion-mode)
  :config
  (setq minuet-provider 'claude
        minuet-auto-suggestion-debounce-delay 0.2
        minuet-auto-suggestion-throttle-delay 0.5))

(use-package! claude-code-ide
  :bind ("C-c C-'" . claude-code-ide-menu)
  :config
  (claude-code-ide-emacs-tools-setup))
