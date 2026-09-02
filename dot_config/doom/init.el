;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

;; Keep this close to Doom's default module set. Run `doom sync` after changing
;; modules in this file.
(doom! :completion
       (corfu +orderless)
       vertico

       :ui
       doom
       dashboard
       hl-todo
       modeline
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       snippets
       (whitespace +guess +trim)
       word-wrap

       :emacs
       dired
       electric
       tramp
       undo
       vc

       :checkers
       syntax

       :tools
       (eval +overlay)
       lookup
       magit

       :os
       (:if (featurep :system 'macos) macos)

       :lang
       emacs-lisp
       markdown
       org
       sh

       :config
       (default +bindings +smartparens))
