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
;; accept. For example:
;;
(setq doom-font (font-spec :family "Hasklig" :size 12))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'pmn-zenbadger)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

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

(use-package! treemacs
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'deferred)
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;; --------------
;; Language Tools
;; --------------

(use-package! treesit
  :config
  (dolist (mapping
           '(("\\.tsx\\'" . tsx-ts-mode)
             ("\\.js\\'"  . typescript-ts-mode)
             ("\\.mjs\\'" . typescript-ts-mode)
             ("\\.mts\\'" . typescript-ts-mode)
             ("\\.cjs\\'" . typescript-ts-mode)
             ("\\.ts\\'"  . typescript-ts-mode)
             ("\\.jsx\\'" . tsx-ts-mode)
             ("\\.json\\'" . json-ts-mode)
             ("\\.Dockerfile\\'" . dockerfile-ts-mode)
             ("\\.prisma\\'" . prisma-ts-mode)))
    (add-to-list 'auto-mode-alist mapping))

  (setq treesit-language-source-alist
        '((css "https://github.com/tree-sitter/tree-sitter-css" "master")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (prisma "https://github.com/victorhqc/tree-sitter-prisma")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))

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

(use-package! gptel
  :config
  (setq gptel-api-key (getenv "OPENAI_API_KEY")
        gptel-model 'claude-3-5-sonnet-20241022
        gptel-backend (gptel-make-anthropic "claude-3-5-sonnet-20241022"
                        :stream t
                        :key (getenv "ANTHROPIC_API_KEY"))))

;; To initialize:
;; > M-x copilot-install-server
;; > M-x copilot-login
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(use-package! aider
  :config
  (setq aider-args '("--chat-mode" "ask"
                     ;; ANTHROPIC_API_KEY needs to be in the environment for this to work
                     "--model" "anthropic/claude-3-5-sonnet-20241022")))
