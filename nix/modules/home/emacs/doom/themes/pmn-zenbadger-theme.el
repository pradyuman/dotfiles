;;; pmn-zenbadger-theme.el --- a combination of cann's Badger and zenwritten dark -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;;; Commentary:
;;  Combines the base colors of badger with the terminal colors of zenwritten dark. See:
;;  - https://github.com/ccann/badger-theme/blob/master/badger-theme.el
;;  - https://github.com/mcchrish/zenbones.nvim/blob/33672310aac6b823c88cf16d5d99472439111f9c/colors/zenwritten.vim
;;
;;; Code:

(require 'doom-themes)

;;; Theme definition

(def-doom-theme
 pmn-zenbadger
 "A dark theme inspired by the original badger theme and zenwritten dark."

 ;; name        default   256       16
 ((bg         '("#171717" nil       nil            )) ;; badger-bg
  (bg-alt     '("#2f2f2f" nil       nil            )) ;; badger-bg+1
  (base0      '("#1d1d1d" "black"   "black"        )) ;; badger-hl
  (base1      '("#1c1f24" "#1e1e1e" "brightblack"  )) ;;
  (base2      '("#202328" "#2e2e2e" "brightblack"  )) ;;
  (base3      '("#23272e" "#262626" "brightblack"  )) ;;
  (base4      '("#433f4f" "#3f3f3f" "brightblack"  )) ;;
  (base5      '("#635770" "#525252" "brightblack"  )) ;;
  (base6      '("#656868" "#6b6b6b" "brightblack"  )) ;; badger-charcoal
  (base7      '("#9ca0a4" "#979797" "brightblack"  )) ;;
  (base8      '("#dfdfdf" "#dfdfdf" "white"        )) ;;
  (fg         '("#c9c9c9" "#c9c9c9" "brightwhite"  )) ;; zenwritten-cursor
  (fg-alt     '("#8e8e8e" "#8e8e8e" "white"        )) ;; zenwritten-brightwhite

  (grey       base4)
  (red        '("#e2434c" "#de6e7c" "red"          )) ;; badger-red, zenwritten-red
  (orange     '("#ea9847" "#dd8844" "brightred"    )) ;; badger-orange
  (green      '("#86b187" "#819b69" "green"        )) ;; badger-green, zenwritten-green
  (teal       '("#65a399" "#8bae68" "brightgreen"  )) ;; badger-teal, zenwritten-brightgreen
  (yellow     '("#e0d063" "#ecbe7b" "yellow"       )) ;; badger-yellow
  (blue       '("#8ac6f2" "#61abda" "brightblue"   )) ;; badger-blue, zenwritten-brightblue
  (dark-blue  '("#2257a0" "#2257a0" "blue"         )) ;;
  (magenta    '("#e18cbb" "#cf86c1" "brightmagenta")) ;; badger-pink, zenwritten-brightmagenta
  (violet     '("#bf93c3" "#b279a7" "magenta"      )) ;; badger-violet, zenwritten-magents
  (cyan       '("#65b8c1" "#65b8c1" "brightcyan"   )) ;; zenwritten-brightcyan
  (dark-cyan  '("#66a5ad" "#66a5ad" "cyan"         )) ;; zenwritten-cyan

  ;; custom
  (olive          '("#9aa68e")) ;; badger-olice
  (lime           '("#84c452")) ;; badger-lime
  (link           '("#8acdaa")) ;; badger-link
  (dull-red       '("#a55662")) ;; badger-dull-red
  (brown          '("#ac8952")) ;; badger-brown
  (sand           '("#c7b299")) ;; badger-sand
  (salmon         '("#f28b86")) ;; badger-salmon
  (dark-violet    '("#635770")) ;; badger-dark-violet

  ;; face categories -- required for all themes
  (highlight      blue)
  (vertical-bar   (doom-darken base4 0.1))
  (selection      dark-blue)
  (builtin        salmon)
  (comments       base6)
  (doc-comments   (doom-lighten base6 0.25))
  (constants      dark-violet)
  (functions      orange)
  (keywords       blue)
  (methods        cyan)
  (operators      sand)
  (type           sand)
  (strings        green)
  (variables      violet)
  (numbers        fg)
  (region         `(,(doom-lighten (car bg-alt) 0.1) ,@(doom-lighten (cdr base0) 0.1)))
  (error          red)
  (warning        yellow)
  (success        green)
  (vc-modified    orange)
  (vc-added       green)
  (vc-deleted     red)

  ;; custom categories
  (hidden     `(,(car bg) "black" "black"))

  (modeline-fg     fg)
  (modeline-fg-alt base5)

  (modeline-bg `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0)))
  (modeline-bg-l `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0)))
  (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
  (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


 ;; Base theme face overrides
 (((line-number &override) :foreground base6)
  ((line-number-current-line &override) :foreground fg)
  (mode-line :background modeline-bg :foreground modeline-fg)
  (mode-line-inactive :background modeline-bg-inactive :foreground modeline-fg-alt)
  (mode-line-emphasis :foreground highlight)

  ;; centaur tabs
  (centaur-tabs-selected-modified   :background bg :foreground yellow)
  (centaur-tabs-unselected-modified :background bg-alt :foreground yellow)

  ;; css-mode <built-in> / scss-mode
  (css-proprietary-property :foreground orange)
  (css-property             :foreground green)
  (css-selector             :foreground blue)

  ;; doom-modeline
  (doom-modeline-bar :background highlight)
  (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
  (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
  (doom-modeline-buffer-project-root :foreground green :weight 'bold)

  ;; elscreen
  (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

  ;; ivy
  (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

  ;;linum
  (linum :foreground base6 :background base6)

  ;; markdown-mode
  (markdown-markup-face :foreground base5)
  (markdown-header-face :inherit 'bold :foreground red)
  ((markdown-code-face &override) :background (doom-lighten base3 0.05))

  ;; org <built-in>
  (org-agenda-date :foreground blue)
  (org-agenda-date-today  :foreground salmon :weight 'light :slant 'italic)
  (org-agenda-structure  :inherit font-lock-comment-face)
  (org-archived :foreground fg :weight 'bold)
  ((org-code &override) :foreground olive)
  (org-column :background "black")
  (org-column-title :background "black" :foreground lime :underline t)
  (org-date :foreground link :underline t)
  (org-deadline-announce :foreground dull-red)
  (org-document-info-keyword :foreground olive)
  (org-document-title :foreground salmon :height 1.50)
  (org-done :foreground lime :strike-through t)
  (org-footnote :foreground link :underline t)
  (org-formula :foreground violet)
  (org-headline-done :strike-through t :foreground base6)
  (org-hide :foreground bg)
  (org-hide :foreground hidden)
  (org-level-1 :foreground blue)
  (org-level-2 :foreground violet)
  (org-level-3 :foreground orange)
  (org-level-4 :foreground yellow)
  (org-level-5 :foreground salmon)
  (org-level-6 :foreground green)
  (org-level-7 :foreground brown)
  (org-level-8 :foreground teal)
  (org-link :foreground link :underline t)
  (org-mode-line-clock :foreground yellow)
  (org-special-keyword :foreground olive :weight 'normal)
  (org-table :foreground olive)
  (org-tag :bold t :foreground orange :strike-through nil)
  (org-todo :foreground red)
  (org-verbatim :inherit 'org-code)
  (org-warning :bold t :foreground magenta :weight 'bold)

  ;; popup
  (popup-tip-face :background sand :foreground "black")
  (popup-scroll-bar-foreground-face :background dark-violet)
  (popup-scroll-bar-background-face :background olive)
  (popup-isearch-match :background yellow :foreground "black")

  ;; solaire-mode
  (solaire-mode-line-face
   :inherit 'mode-line
   :background modeline-bg-l)
  (solaire-mode-line-inactive-face
   :inherit 'mode-line-inactive
   :background modeline-bg-inactive-l)

  ;; treemacs
  (treemacs-directory-face    :foreground base6)
  (treemacs-git-modified-face :foreground yellow)
  (treemacs-file-face         :foreground base8)
  (treemacs-root-face         :foreground blue :weight 'bold)
  (doom-themes-treemacs-file-face :foreground blue)

  ;; web-mode
  (web-mode-block-control-face    :foreground orange)
  (web-mode-block-delimiter-face  :foreground sand)
  (web-mode-html-attr-equal-face  :foreground fg)
  (web-mode-html-attr-name-face   :foreground base8)
  (web-mode-html-tag-bracket-face :foreground sand)
  (web-mode-html-tag-face         :foreground blue)
  (web-mode-keyword-face          :foreground blue)
  (web-mode-variable-name-face    :foreground (doom-lighten constants 0.3)))

 ()
 )

;;; pmn-zenbadger-theme.el ends here
