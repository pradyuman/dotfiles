;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; --------------
;; Language Tools
;; --------------

(package! just-mode)
(package! prisma-ts-mode)
(package! rainbow-mode)
(package! rainbow-delimiters)
(package! typespec-ts-mode)

(package! lsp-biome
  :recipe (:host github :repo "cxa/lsp-biome"))

;; --------
;; Terminal
;; --------

;; Supplied by Nix.
(package! ghostel :built-in t)
(package! evil-ghostel :built-in t)
