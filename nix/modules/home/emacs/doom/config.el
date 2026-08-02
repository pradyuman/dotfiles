;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ---------
;; Interface
;; ---------

(setq doom-theme 'pmn-zenbadger)
(setq display-line-numbers-type t)

(after! doom-modeline
  (setq doom-modeline-check-simple-format t))

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

(setq +treemacs-git-mode 'deferred)

(after! treemacs
  (treemacs-follow-mode 1)
  (map! :map treemacs-mode-map
        [mouse-1] #'treemacs-single-click-expand-action))

(after! corfu
  (setq corfu-auto-delay 0.1
        corfu-auto-prefix 1)
  ;; ESC without exiting insert mode (to hide corfu suggestions while keeping the minuet ones)
  (map! :map corfu-map
        :i "ESC" #'corfu-quit
        :i [escape] #'corfu-quit))

;; --------------------
;; Programming Defaults
;; --------------------

(setq tab-width 2)

;; --------------
;; Language Tools
;; --------------

(after! treesit
  (dolist (mapping
           '(("\\.js\\'"  . typescript-ts-mode)
             ("\\.mjs\\'" . typescript-ts-mode)
             ("\\.mts\\'" . typescript-ts-mode)
             ("\\.cjs\\'" . typescript-ts-mode)
             ("\\.ts\\'"  . typescript-ts-mode)
             ("\\.jsx\\'" . tsx-ts-mode)
             ("\\.tsx\\'" . tsx-ts-mode)
             ("\\.json\\'" . json-ts-mode)
             ("\\.yaml\\'" . yaml-ts-mode)
             ("\\Dockerfile\\'" . dockerfile-ts-mode)))
    (add-to-list 'auto-mode-alist mapping))

  (dolist (mapping
           '((css-mode . css-ts-mode)
             (typescript-mode . typescript-ts-mode)
             (js-mode . typescript-ts-mode)
             (js2-mode . typescript-ts-mode)
             (json-mode . json-ts-mode)
             (js-json-mode . json-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))
  (setq treesit-font-lock-level 4))

(after! lsp-mode
  (setq lsp-idle-delay 0.1))

(use-package! lsp-biome
  :preface
  (defun +biome-setup-h ()
    (setq-local apheleia-formatter '(biome))
    (add-hook 'before-save-hook #'lsp-biome-organize-imports nil t)
    (add-hook 'before-save-hook #'lsp-biome-fix-all nil t))
  :config
  (add-hook 'lsp-biome-active-hook #'+biome-setup-h))

(add-hook! '(typescript-ts-mode-hook tsx-ts-mode-hook) #'lsp-deferred)

(use-package! rainbow-delimiters
  :hook
  (typescript-ts-mode . rainbow-delimiters-mode)
  (tsx-ts-mode . rainbow-delimiters-mode))

;; ---
;; LLM
;; ---

(use-package! minuet
  :bind
  (:map minuet-active-mode-map
        ;; This keymap is active only while Minuet displays a suggestion.
        ("M-p" . #'minuet-previous-suggestion)
        ("M-n" . #'minuet-next-suggestion)
        ("M-a" . #'minuet-accept-suggestion)
        ;; Accept the first line, or N lines when given a numeric prefix.
        ;; For example, C-u 2 M-A accepts two lines.
        ("M-A" . #'minuet-accept-suggestion-line)
        ("M-e" . #'minuet-dismiss-suggestion))
  :hook (prog-mode . minuet-auto-suggestion-mode)
  :config
  (setq minuet-provider 'claude
        minuet-auto-suggestion-debounce-delay 0.1
        minuet-auto-suggestion-throttle-delay 0.25))
