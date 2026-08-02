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

;; ---
;; LLM
;; ---

(package! minuet)
