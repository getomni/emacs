;;; omni-theme.el --- A dark theme -*- lexical-binding: t -*-

;; Copyright (C) 2021 Matheus de Souza Pessanha

;; Author: Matheus Pessanha <mdsp@boosting.tech>
;; Keywords: theme, dark
;; URL: https://github.com/getomni/omni
;; Version: 1.0
;; Package: omni-theme
;; Package-Requires: ((emacs "25.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; This file is NOT part of GNU Emacs

;;; Commentary:
;;
;; A dark theme heavily inspired from Dracula.
;;

;;; Code:

(defmacro omni--cached-for (secs &rest body)
  "Cache for SECS the result of the evaluation of BODY."
  (declare (debug t))
  (let ((cache (make-symbol "cache"))
        (last-run (make-symbol "last-run")))
    `(let (,cache ,last-run)
       (lambda ()
         (when (or (null ,last-run)
                   (> (- (time-to-seconds (current-time)) ,last-run)
                      ,secs))
           (setf ,cache (progn ,@body))
           (setf ,last-run (time-to-seconds (current-time))))
         ,cache))))

(deftheme omni
  "A dark theme")

(defgroup omni
  nil
  "A dark theme inspired from Dracula."
  :group 'faces)

(defcustom omni-use-paddings-in-mode-line t
  "When non-nil, use top and bottom paddings in the mode-line."
  :type 'boolean)

(defcustom omni-theme-display-vc-status 'full
  "Control how version control information is displayed."
  :type '(choice (const :tag "Display fork symbol and branch name" 'full)
                 (const :tag "Display fork symbol only" t)
                 (const :tag "Do not display any version control information" nil)))

(defface omni-ro-face
  '((t :foreground "#2595a9" :weight bold))
  "Face for read-only buffer in the mode-line.")

(defface omni-modified-face
  '((t :foreground "#e96379" :height 0.9))
  "Face for modified buffers in the mode-line.")

(defface omni-not-modified-face
  '((t :foreground "#67e480" :height 0.9))
  "Face for not modified buffers in the mode-line.")

(defface omni-buffer-position-face
  '((t :height 0.9))
  "Face for line/column numbers in the mode-line.")

(defface omni-vc-face
  '((t :foreground "#78d1e1"))
  "Face for vc status in the mode-line.")

(defface omni-ok-face
  '((t :foreground "#78d1e1"))
  "Face for ok status in the mode-line.")

(defface omni-warning-face
  '((t :foreground "#e89e64"))
  "Face for warning status in the mode-line.")

(defface omni-error-face
  '((t :foreground "#e96379"))
  "Face for error status in the mode-line.")

(defvar omni-buffer-coding '(:eval (unless (eq buffer-file-coding-system (default-value 'buffer-file-coding-system))
                                     mode-line-mule-info)))

(defun omni--true-color-p ()
  "Return non-nil on displays that support 256 colors."
  (or
   (display-graphic-p)
   (= (tty-display-color-cells) 16777216)))

(let ((class '((class color) (min-colors 89)))
      (default (if (omni--true-color-p) "#abb2bf" "#afafaf"))
      (light (if (omni--true-color-p) "#cbcbd3" "#e1e1e6"))
      (background (if (omni--true-color-p) "#231e2f" "#191622"))
      (background-darker (if (omni--true-color-p) "#2b253a" "#110f17"))
      (background-lighter (if (omni--true-color-p) "#272236" "#231e2f"))
      (mode-line (if (omni--true-color-p) "#1c2129" "#222222"))
      (background-red (if (omni--true-color-p) "#432b2b" "#221616"))
      (bright-background-red (if (omni--true-color-p) "#825353" "#744b4b"))
      (background-purple (if (omni--true-color-p) "#3b2b43" "#1e1622"))
      (background-blue (if (omni--true-color-p) "#2b2b43" "#161622"))
      (bright-background-blue (if (omni--true-color-p) "#535382" "#4b4b74"))
      (background-green (if (omni--true-color-p) "#31432b" "#192216"))
      (bright-background-green (if (omni--true-color-p) "#5f8253" "#55744b"))
      (background-orange (if (omni--true-color-p) "#43392b" "#221d16"))
      (hl-line (if (omni--true-color-p) "#51546c" "#44475a"))
      (grey (if (omni--true-color-p) "#cccccc" "#cccccc"))
      (grey-dark (if (omni--true-color-p) "#666666" "#666666"))
      (highlight (if (omni--true-color-p) "#51515f" "#41414d"))
      (comment (if (omni--true-color-p) "#544779" "#483c67"))
      (orange (if (omni--true-color-p) "#e6985b" "#e89e64"))
      (orange-light (if (omni--true-color-p) "#eaaf7f" "#eebb92"))
      (red (if (omni--true-color-p) "#e75a72" "#e96379"))
      (purple (if (omni--true-color-p) "#9183c3" "#988bC7"))
      (purple-light (if (omni--true-color-p) "#a69bce" "#a296cc"))
      (purple-dark (if (omni--true-color-p) "#6251a7" "#5e4d9f"))
      (blue (if (omni--true-color-p) "#6dccde" "#78d1e1"))
      (blue-dark (if (omni--true-color-p) "#2db5cd" "#2baec5"))
      (green (if (omni--true-color-p) "#5ee279" "#67e480"))
      (green-light (if (omni--true-color-p) "#82e796" "#94eca6"))
      (yellow (if (omni--true-color-p) "#e8df7f" "#e7de79"))
      (pink (if (omni--true-color-p) "#ff7fc8" "#ff79c6"))
      (peach "PeachPuff3")
      (diff-added-refined-background (if (omni--true-color-p) "#20946e" "#186e52"))
      (diff-removed-refined-background (if (omni--true-color-p) "#c35e69" "#bf505c")))
  (custom-theme-set-faces
   'omni
   `(default ((,class (:background ,background :foreground ,light))))
   `(cursor ((,class (:background ,light))))

   ;; Highlighting faces
   `(line-number ((,class (:background ,background :foreground ,comment))))
   `(fringe ((,class (:background ,background :foreground ,comment))))
   `(border ((,class (:foreground ,background))))
   `(vertical-border ((,class (:foreground ,background))))
   `(highlight ((,class (:background ,highlight :foreground ,default :underline nil))))
   `(region ((,class (:background ,highlight))))
   `(secondary-selection ((,class (:background ,highlight :foreground ,default))))
   `(isearch ((,class (:background ,orange-light :foreground ,highlight))))
   `(lazy-highlight ((,class (:background ,grey-dark :foreground ,orange-light))))
   `(hl-line ((,class (:background ,hl-line :underline unspecified :inherit nil))))
   `(shadow ((,class (:foreground ,comment))))

   `(match ((,class (:background ,background-green))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,blue :weight bold))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,orange :weight bold))))
   `(font-lock-function-name-face ((,class (:foreground ,green))))
   `(font-lock-keyword-face ((,class (:foreground ,pink :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,yellow))))
   `(font-lock-doc-face ((,class (:foreground ,comment))))
   `(font-lock-type-face ((,class (:foreground ,purple-light))))
   `(font-lock-variable-name-face ((,class (:foreground ,light))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold :background ,background-red))))

   ;; Mode line faces
   `(mode-line ((,class (:background ,mode-line :height 0.9 :foreground ,light
                                     :box ,(when omni-use-paddings-in-mode-line
                                             (list :line-width 6 :color mode-line))))))
   `(mode-line-inactive ((,class (:background ,mode-line :height 0.9 :foreground ,comment
                                              :box ,(when omni-use-paddings-in-mode-line
                                                      (list :line-width 6 :color mode-line))))))
   `(header-line ((,class (:inherit mode-line-inactive))))

   ;; error & success
   `(error ((,class (:foreground ,red :weight bold))))
   `(warning ((,class (:foreground ,orange :weight bold))))
   `(success ((,class (:foreground ,green :weight bold))))

   ;; powerline
   `(powerline-active1 ((,class (:height 0.9 :foreground ,blue :background ,background-darker))))
   `(powerline-active2 ((,class (:height 0.9 :foreground ,blue :background ,background-lighter))))

   ;; mml
   `(message-mml-face ((,class (:foreground ,comment))))

   ;; Org-clock mode line
   `(org-mode-line-clock ((,class (:background unspecified (:inherit mode-line)))))

   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:foreground ,blue :weight bold))))
   `(escape-glyph ((,class (:foreground ,blue :weight bold))))

   ;; linum
   `(linum ((,class (:foreground ,comment :background ,background))))
   ;; from hlinum
   `(linum-highlight-face ((,class (:foreground ,blue ,background ,background-blue))))

   ;; native line numbers (emacs 26)
   `(line-number ((,class (:foreground ,comment :background ,background-darker))))
   `(line-number-current-line ((,class (:foreground ,blue :background ,background-darker))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,blue :background ,background :weight bold))))
   `(eshell-ls-directory ((,class (:foreground ,purple :background ,background :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,orange :background ,background :weight normal))))
   `(eshell-ls-executable ((,class (:foreground ,green :background ,background :weight bold))))

   ;; whitespace
   `(whitespace-space ((,class (:background unspecified :foreground ,highlight
                                            :inverse-video unspecified))))
   `(whitespace-hspace ((,class (:background unspecified :foreground ,highlight
                                             :inverse-video unspecified))))
   `(whitespace-tab ((,class (:background unspecified :foreground ,highlight
                                          :inverse-video unspecified))))
   `(whitespace-newline ((,class (:background unspecified :foreground ,highlight
                                              :inverse-video unspecified))))
   `(whitespace-trailing ((,class (:background ,red :foreground ,background :weight bold
                                               :inverse-video nil))))
   `(whitespace-line ((,class (:background unspecified :foreground ,red
                                           :inverse-video unspecified))))
   `(whitespace-space-before-tab ((,class (:inherit whitespace-space))))
   `(whitespace-space-after-tab ((,class (:inherit whitespace-space))))
   `(whitespace-indentation ((,class (:background unspecified :foreground ,highlight
                                                  :inverse-video unspecified))))
   `(whitespace-empty ((,class (:background ,orange :foreground ,highlight
                                            :inverse-video unspecified))))

   ;; link faces
   `(link ((,class (:foreground ,blue :underline t))))
   `(link-visited ((,class (:foreground ,blue :underline t))))

   ;; widget faces
   `(widget-field ((,class (:background ,highlight :box (:line-width 1 :color ,comment)))))
   `(widget-button ((,class (:inherit link))))

   ;; custom
   `(custom-button ((,class (:background ,background-lighter :box (:line-width 2 :style released-button)))))
   `(custom-button-mouse ((,class (:background ,highlight :box (:line-width 2 :style released-button)))))
   `(custom-button-pressed ((,class (:background ,highlight :box (:line-width 2 :style pressed-button)))))
   `(custom-group-tag ((,class (:foreground ,purple :weight bold :height 1.4))))
   `(custom-variable-tag ((,class (:foreground ,purple :weight bold))))
   `(custom-state ((,class (:foreground ,green))))

   ;; compilation
   `(compilation-info ((,class (:foreground ,purple :weight bold))))
   `(compilation-warning ((,class (:foreground ,orange :weight bold))))
   `(compilation-error ((,class (:foreground ,red :weight bold))))
   `(compilation-line-number ((,class (:foreground ,green :weight bold))))
   `(compilation-mode-line-exit ((,class (:foreground ,green :weight bold :inverse-video nil))))
   `(compilation-mode-line-run ((,class (:foreground ,orange :weight bold))))
   `(compilation-mode-line-fail ((,class (:foreground ,red :weight bold))))

   ;; dired
   `(dired-header ((,class (:foreground ,blue :background ,background-blue :weight bold))))
   `(dired-directory ((,class (:foreground ,purple :weight bold))))

   ;; centaur-tabs
   `(centaur-tabs-default ((t (:background ,background :foreground ,light))))
   `(centaur-tabs-selected ((t (:background ,background-lighter :foreground ,light :weight bold))))
   `(centaur-tabs-unselected ((t (:background ,background-darker :foreground ,light :weight light))))
   `(centaur-tabs-selected-modified ((t (:background ,background
                                                     :foreground ,light :weight bold))))
   `(centaur-tabs-unselected-modified ((t (:background ,background :weight light
                                                       :foreground ,light))))
   `(centaur-tabs-active-bar-face ((t (:background ,purple-dark))))
   `(centaur-tabs-modified-marker-selected ((t (:inherit 'centaur-tabs-selected :foreground,light))))
   `(centaur-tabs-modified-marker-unselected ((t (:inherit 'centaur-tabs-unselected :foreground,light))))

   ;; diff
   `(diff-removed ((,class (:background ,background-red :foreground ,red))))
   `(diff-added ((,class (:background ,background-green :foreground ,green))))
   `(diff-hunk-header ((,class (:background ,background-blue :weight bold :foreground ,blue))))
   `(diff-file-header ((,class (:weight bold))))
   `(diff-header ((,class (:background ,background :foreground ,blue))))
   `(diff-context ((,class (:foreground ,default))))
   `(diff-refine-added ((,class (:foreground ,green :background ,bright-background-green))))
   `(diff-refine-removed ((,class (:background ,bright-background-red :foreground ,red))))

   ;; ediff
   `(ediff-fine-diff-B ((,class (:inherit diff-refine-added))))
   `(ediff-current-diff-B ((,class (:inherit diff-added))))
   `(ediff-fine-diff-A ((,class (:inherit diff-refine-removed))))
   `(ediff-current-diff-A ((,class (:inherit diff-removed))))
   `(ediff-fine-diff-C ((,class (:foreground ,blue :background ,bright-background-blue))))
   `(ediff-current-diff-C ((,class (:background ,background-blue :foreground ,blue))))

   ;; magit
   `(magit-diff-context-highlight ((,class (:background ,background-darker))))
   `(magit-diff-file-heading ((,class (:weight bold :foreground ,blue))))
   `(magit-diff-file-heading-highlight ((,class (:weight bold :foreground ,blue :background ,background-blue))))
   `(magit-diff-removed-highlight ((,class (:inherit diff-removed))))
   `(magit-diff-removed ((,class (:inherit diff-removed))))
   `(magit-diff-added-highlight ((,class (:inherit diff-added))))
   `(magit-diff-added ((,class (:inherit diff-added))))
   `(magit-diff-lines-heading ((,class (:background ,blue-dark :foreground "white"))))
   `(magit-diff-hunk-heading ((,class (:background ,background-lighter))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,blue-dark))))
   `(magit-diff-hunk-heading ((,class (:background ,background-lighter))))

   `(magit-process-ok ((,class (:foreground ,green :weight bold))))

   `(magit-section-highlight ((,class (:background ,background-darker))))
   `(magit-section-heading ((,class (:foreground ,grey :weight bold))))
   `(magit-branch-current ((,class (:foreground ,blue :background ,background-darker :box 1))))
   `(magit-branch-local ((,class (:foreground ,purple :background ,background-darker :box 1))))
   `(magit-branch-remote ((,class (:foreground ,green :background ,background-darker :box 1))))

   `(magit-reflog-reset ((,class (:background ,background-red :foreground ,red :weight bold))))
   `(magit-reflog-amend ((,class (:background ,background-blue :foreground ,blue :weight bold))))
   `(magit-reflog-rebase ((,class (:background ,background-blue :foreground ,blue :weight bold))))
   `(magit-reflog-commit ((,class (:background ,background-green :foreground ,green :weight bold))))
   `(magit-reflog-checkout ((,class (:background ,background-orange :foreground ,orange :weight bold))))
   `(magit-reflog-cherry-pick ((,class (:background ,background-purple :foreground ,purple :weight bold))))

   `(magit-refname-pullreq ((,class (:background , background-orange :foreground ,orange :weight bold))))

   `(magit-bisect-bad ((,class (:background ,background-red :foreground ,red :box 1))))
   `(magit-bisect-good ((,class (:background ,background-blue :foreground ,blue :box 1))))

   `(magit-signature-bad ((,class (:foreground ,red))))
   `(magit-signature-good ((,class (:foreground ,blue))))

   `(magit-blame-heading ((,class (:foreground ,green :background ,background-green :box 1))))

   `(git-commit-summary ((,class (:weight bold))))

   `(magit-tag ((,class (:foreground ,purple :weight bold :box 1 :background "#202020"))))
   `(magit-sequence-part ((,class (:foreground ,orange :weight bold))))
   `(magit-sequence-head ((,class (:foreground ,green :weight bold))))

   ;; Message faces
   `(message-header-name ((,class (:foreground ,blue :weight bold))))
   `(message-header-cc ((,class (:foreground ,purple))))
   `(message-header-other ((,class (:foreground ,purple))))
   `(message-header-subject ((,class (:foreground ,green))))
   `(message-header-to ((,class (:foreground ,purple))))
   `(message-cited-text ((,class (:foreground ,comment))))
   `(message-separator ((,class (:foreground ,red :weight bold))))

   ;; ido faces
   `(ido-first-match ((,class (:foreground ,purple :weight bold))))
   `(ido-only-match ((,class (:foreground ,purple :weight bold))))
   `(ido-subdir ((,class (:foreground ,blue))))

   ;; notmuch
   `(notmuch-message-summary-face ((,class (:background ,highlight :box (:line-width 2 :color ,background)))))
   `(notmuch-search-count ((,class (:foreground ,red :weight bold))))
   `(notmuch-search-matching-authors ((,class (:foreground ,comment))))
   `(notmuch-search-subject ((,class (:foreground ,default))))
   `(notmuch-search-unread-face ((,class (:weight bold))))
   `(notmuch-search-date ((,class (:foreground ,purple))))
   `(notmuch-crypto-part-header ((,class (:foreground ,blue))))
   `(notmuch-crypto-decryption ((,class (:foreground ,purple))))
   `(notmuch-crypto-signature-unknown ((,class (:foreground ,red))))
   `(notmuch-crypto-signature-good ((,class (:background ,blue :foreground ,background :weight bold))))
   `(notmuch-crypto-signature-good-key ((,class (:background ,blue :foreground ,background :weight bold))))
   `(notmuch-crypto-signature-bad ((,class (:background ,red :foreground ,background :weight bold))))
   `(notmuch-tag-face ((,class (:foreground ,green :weight bold))))
   `(notmuch-tree-match-author-face ((,class (:foreground ,purple))))
   `(notmuch-tree-match-tag-face ((,class (:foreground ,green :weight bold))))

   ;; mu4e
   `(mu4e-highlight-face ((,class (:foreground ,purple :background ,background :weight bold))))
   `(mu4e-header-value-face ((,class (:foreground ,purple))))
   `(mu4e-contact-face ((,class (:foreground ,purple))))
   `(mu4e-special-header-value-face ((,class (:foreground ,green :weight bold))))

   ;; company
   `(company-preview ((,class (:background ,background-darker :foreground ,default))))
   `(company-preview-common ((,class (:background ,background-darker :foreground ,purple))))
   `(company-preview-search ((,class (:background ,blue :foreground ,default))))
   `(company-tooltip ((,class (:background ,background-darker :foreground ,default))))
   `(company-scrollbar-bg ((,class (:background ,background-darker))))
   `(company-scrollbar-fg ((,class (:background ,background-blue))))
   `(company-tooltip-common ((,class (:foreground ,purple :weight bold :background ,background-darker))))
   `(company-tooltip-annotation ((,class (:foreground ,blue :weight bold :background ,background-blue))))
   `(company-tooltip-common-selection ((,class (:foreground ,purple :background ,background-lighter :weight bold))))
   `(company-tooltip-selection ((,class (:foreground ,default :background ,background-lighter))))
   `(company-tooltip-mouse ((,class (:foreground ,default :background ,background-lighter))))

   ;; web-mode
   `(web-mode-html-tag-face ((,class (:foreground ,purple :weight bold))))
   `(web-mode-symbol-face ((,class (:foreground ,red :weight bold))))

   ;; js2-mode
   `(js2-function-param ((,class (:foreground ,blue))))
   `(js2-error ((,class (:foreground ,red))))
   `(js2-jsdoc-html-tag-name ((,class (:foreground ,peach))))
   `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,peach))))

   ;; flycheck
   `(flycheck-fringe-error ((,class (:foreground ,red :background ,background-red :weight bold :inverse-video t))))
   `(flycheck-fringe-warning ((,class (:background ,background-orange :foreground ,orange :weight bold :inverse-video t))))
   `(flycheck-fringe-info ((,class (:background ,background-blue :foreground ,blue :weight bold :inverse-video t))))
   `(flycheck-warning ((,class (:underline (:color ,red :style wave)))))
   `(flycheck-error ((,class (:underline (:color ,red :style wave)))))

   ;; FIC
   `(font-lock-fic-face ((,class (:foreground ,background :background ,red :weight bold))))

   ;; org-mode todo
   `(org-hide ((,class (:foreground ,background))))
   `(org-todo ((,class (:foreground ,red :background ,background-red :weight bold))))
   `(org-done ((,class (:foreground ,green :background ,background-green :weight bold))))
   `(org-date ((,class (:foreground ,purple :background ,background-purple :weight bold))))
   `(org-scheduled-previously ((,class (:foreground ,red))))
   `(org-scheduled ((,class (:foreground ,default))))
   `(org-upcoming-deadline ((,class (:foreground ,orange))))
   `(org-headline-done ((,class (:foreground ,comment))))
   `(org-document-title ((,class (:foreground ,orange :height 1.5))))
   `(outline-1 ((,class (:foreground ,peach :weight bold :height 1.3))))
   `(outline-2 ((,class (:foreground ,purple :weight bold :height 1.2))))
   `(outline-3 ((,class (:foreground ,blue :weight bold :height 1.1))))
   `(outline-4 ((,class (:foreground ,green-light :weight bold))))
   `(outline-5 ((,class (:foreground ,peach :weight bold))))
   `(outline-6 ((,class (:foreground ,purple :weight bold))))
   `(outline-7 ((,class (:foreground ,blue :weight bold))))
   `(outline-8 ((,class (:foreground ,green-light :weight bold))))
   `(org-column-title ((,class (:foreground unspecified :background unspecified))))
   `(org-agenda-date ((,class (:foreground ,purple :weight bold))))
   `(org-agenda-date-today ((,class (:foreground ,blue :weight bold :background ,background-blue :box 1))))
   `(org-agenda-structure ((,class (:foreground ,blue :weight bold))))
   `(org-scheduled-today ((,class (:foreground ,default :weight bold))))
   `(org-agenda-done ((,class (:foreground ,comment))))
   `(org-time-grid ((,class (:foreground ,comment))))
   `(org-drawer ((,class (:inherit shadow))))

   ;; org columns
   `(org-column ((,class (:background ,background-darker))))
   `(org-column-title ((,class (:background ,background-blue :foreground ,blue :weight bold))))

   ;; org blocks
   `(org-block-begin-line ((,class (:background ,background-lighter :foreground ,light :height 0.9 :extend t))))
   `(org-block-end-line ((,class (:background ,background-lighter :foreground ,light :height 0.9 :extend t))))
   `(org-block ((,class (:background ,background-darker :foreground ,light :extend t))))

   ;; org-drill
   `(org-drill-hidden-cloze-face ((,class (:background ,red :foreground ,background))))
   `(org-drill-visible-cloze-face ((,class (:background ,blue :foreground ,background-blue))))
   `(org-drill-visible-cloze-hint-face ((,class (:background ,green :foreground ,background-green))))

   ;; org-Roam
   `(org-roam-link ((,class (:background ,background-blue :foreground ,blue :weight bold))))

   ;; Gnus faces -- from wombat, feel free to improve :)
   `(gnus-group-news-1 ((,class (:weight bold :foreground "#95e454"))))
   `(gnus-group-news-1-low ((,class (:foreground "#95e454"))))
   `(gnus-group-news-2 ((,class (:weight bold :foreground "#cae682"))))
   `(gnus-group-news-2-low ((,class (:foreground "#cae682"))))
   `(gnus-group-news-3 ((,class (:weight bold :foreground "#ccaa8f"))))
   `(gnus-group-news-3-low ((,class (:foreground "#ccaa8f"))))
   `(gnus-group-news-4 ((,class (:weight bold :foreground "#99968b"))))
   `(gnus-group-news-4-low ((,class (:foreground "#99968b"))))
   `(gnus-group-news-5 ((,class (:weight bold :foreground "#cae682"))))
   `(gnus-group-news-5-low ((,class (:foreground "#cae682"))))
   `(gnus-group-news-low ((,class (:foreground "#99968b"))))
   `(gnus-group-mail-1 ((,class (:weight bold :foreground "#95e454"))))
   `(gnus-group-mail-1-low ((,class (:foreground "#95e454"))))
   `(gnus-group-mail-2 ((,class (:weight bold :foreground "#cae682"))))
   `(gnus-group-mail-2-low ((,class (:foreground "#cae682"))))
   `(gnus-group-mail-3 ((,class (:weight bold :foreground "#ccaa8f"))))
   `(gnus-group-mail-3-low ((,class (:foreground "#ccaa8f"))))
   `(gnus-group-mail-low ((,class (:foreground "#99968b"))))
   `(gnus-header-content ((,class (:foreground ,purple))))
   `(gnus-header-from ((,class (:weight bold :foreground "#95e454"))))
   `(gnus-header-subject ((,class (:foreground ,green))))
   `(gnus-header-name ((,class (:foreground ,blue))))
   `(gnus-header-newsgroups ((,class (:foreground "#cae682"))))

   ;; which-function
   `(which-func ((,class (:foreground ,purple))))

   `(ediff-even-diff-A ((,class (:background ,highlight :foreground unspecified))))
   `(ediff-even-diff-B ((,class (:background ,highlight :foreground unspecified))))
   `(ediff-even-diff-C ((,class (:background ,highlight :foreground unspecified))))
   `(ediff-odd-diff-A ((,class (:background ,highlight :foreground unspecified))))
   `(ediff-odd-diff-B ((,class (:background ,highlight :foreground unspecified))))
   `(ediff-odd-diff-C ((,class (:background ,highlight :foreground unspecified))))

   ;; ivy
   `(ivy-current-match ((,class (:background ,background-purple :weight bold :foreground ,purple))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,orange))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,green))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,green))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,green))))
   `(ivy-match-required-face ((,class (:foreground ,red :background ,background-red :weight bold))))
   `(ivy-modified-buffer ((,class (:foreground ,red))))
   `(ivy-remote ((,class (:foreground ,blue))))
   `(ivy-highlight-face ((,class (:foreground ,blue :weight bold))))

   ;; helm
   `(helm-candidate-number ((,class (:weight bold))))
   `(helm-header-line-left-margin ((,class (:weight bold :foreground ,red))))
   `(helm-source-header ((,class (:height 1.2 :weight bold :foreground ,blue :background ,background-blue))))
   `(helm-selection ((,class (:background ,background-lighter))))
   `(helm-match ((,class (:foreground ,purple :background ,background-purple :weight bold))))
   `(helm-match-item ((,class (:inherit isearch))))
   `(helm-M-x-key ((,class (:foreground ,blue :weight bold :background ,background-blue))))
   `(helm-visible-mark ((,class (:weight bold :foreground ,orange :background ,background-darker))))
   `(helm-prefarg ((,class (:weight bold :foreground ,red :background ,background-red))))
   `(helm-separator ((,class (:weight bold :foreground , blue))))

   `(helm-grep-file ((,class ())))
   `(helm-grep-finish ((,class (:foreground ,green))))
   `(helm-grep-running ((,class (:foreground ,red))))
   `(helm-grep-lineno ((,class (:foreground ,blue))))
   `(helm-grep-match ((,class (:foreground ,purple :background ,background-purple :weight bold))))

   `(helm-moccur-buffer ((,class ())))

   `(helm-buffer-directory ((,class (:foreground ,purple))))
   `(helm-buffer-file ((,class ())))
   `(helm-buffer-process ((,class (:foreground ,purple))))
   `(helm-buffer-size ((,class (:foreground ,blue))))
   `(helm-buffer-saved-out ((,class (:foreground ,red :weight bold))))

   `(helm-ff-directory ((,class (:foreground ,purple))))
   `(helm-ff-dotted-directory ((,class (:foreground ,purple))))
   `(helm-ff-prefix ((,class (:weight bold :foreground ,red))))
   `(helm-ff-file ((,class ())))
   `(helm-ff-executable ((,class (:foreground ,green :weight bold :background ,background-green))))
   `(helm-ff-symlink ((,class (:foreground ,orange))))
   `(helm-ff-invalid-symlink ((,class (:foreground ,red :weight bold :background ,background-red))))
   `(helm-history-deleted ((,class (:foreground ,red :weight bold :background ,background-red))))

   `(helm-swoop-target-line-face ((,class (:foreground ,comment :background ,background-lighter))))
   `(helm-swoop-target-line-block-face ((,class (:foreground ,comment :background ,background-lighter :weight bold))))
   `(helm-swoop-target-word-face ((,class (:foreground ,purple :background ,background-purple :weight bold))))
   `(helm-swoop-line-number-face ((,class (:foreground ,comment))))

   ;; visible mark
   `(visible-mark-face1 ((,class (:foreground ,orange-light :inverse-video t))))
   `(visible-mark-face2 ((,class (:foreground ,peach :inverse-video t))))

   ;; show-paren
   `(show-paren-match ((,class (:foreground ,blue :weight bold))))

   ;; clojure
   `(clojure-keyword-face ((,class (:inherit font-lock-builtin-face))))

   ;; ledger
   `(ledger-font-report-clickable-face ((,class (:foreground ,blue))))
   `(ledger-font-posting-amount-face ((,class (:foreground ,purple))))
   `(ledger-font-posting-date-face ((,class (:foreground ,blue :background ,background-blue :box 1))))
   `(ledger-font-payee-uncleared-face ((,class (:foreground ,default :weight bold))))
   `(ledger-font-payee-cleared-face ((,class (:foreground ,green :weight bold))))
   `(ledger-font-posting-account-face ((,class (:foreground ,default))))
   `(ledger-font-posting-account-pending-face ((,class (:foreground ,red))))
   `(ledger-font-xact-highlight-face ((,class (:background ,background-darker))))
   `(ledger-font-other-face ((,class (:inherit ,font-lock-comment-face))))
   `(ledger-font-periodic-xact-face ((,class (:foreground ,orange))))

   `(diff-hl-change ((,class (:foreground ,bright-background-blue :background ,bright-background-blue))))
   `(diff-hl-delete ((,class (:foreground ,bright-background-red :background ,bright-background-red))))
   `(diff-hl-insert ((,class (:foreground ,bright-background-green :background ,bright-background-green))))

   `(git-gutter:added ((,class (:foreground ,green :background ,background-green))))
   `(git-gutter:deleted ((,class (:foreground ,red :background ,background-red))))
   `(git-gutter:modified ((,class (:foreground ,purple :background ,background-purple))))
   `(git-gutter:separator ((,class (:background ,background-orange))))
   `(git-gutter:unchanged ((,class (:background ,background-orange))))

   `(term-color-black ((,class (:foreground ,default :background ,background-darker))))
   `(term-color-red ((,class (:foreground ,red :background ,background-red))))
   `(term-color-green ((,class (:foreground ,green :background ,background-green))))
   `(term-color-yellow ((,class (:foreground ,orange :background ,background-orange))))
   `(term-color-blue ((,class (:foreground ,blue :background ,background-blue))))
   `(term-color-magenta ((,class (:foreground ,purple :background ,background-purple))))
   `(term-color-cyan ((,class (:foreground ,blue-dark))))
   `(term-color-white ((,class (:foreground ,grey))))
   `(term ((,class (:foreground ,default :background ,background))))
   `(term-default-fg-color ((,class (:inherit term-color-white))))
   `(term-default-bg-color ((,class (:inherit term-color-black))))

   `(sh-heredoc ((,class (:foreground ,orange :weight bold))))

   `(avy-lead-face ((,class :foreground ,red :background ,background-red)))
   `(avy-lead-face-0 ((,class :foreground ,purple :background ,background-purple)))
   `(avy-lead-face-1 ((,class :foreground ,blue :background ,background-blue)))
   `(avy-lead-face-2 ((,class :foreground ,green :background ,background-green)))

   `(erc-nick-default-face ((,class :foreground ,blue :background ,background)))
   `(erc-current-nick-face ((,class :foreground ,purple :weight bold)))
   `(erc-my-nick-face ((,class :foreground ,purple :weight bold)))
   `(erc-notice-face ((,class :foreground ,comment)))
   `(erc-input-face ((,class :foreground ,purple :slant italic)))
   `(erc-prompt-face ((,class :foreground ,purple :background ,background :weight bold)))
   `(erc-timestamp-face ((,class :foreground ,purple)))

   ;; slack
   `(slack-message-output-header ((,class :foreground ,blue :background ,background-blue :weight bold)))

   `(hydra-face-red ((,class :foreground ,red :weight bold)))
   `(hydra-face-blue ((,class :foreground ,blue :weight bold)))

   ;; elfeed
   `(elfeed-search-date-face ((,class (:foreground ,blue))))
   `(elfeed-search-feed-face ((,class (:foreground ,blue))))
   `(elfeed-search-tag-face ((,class (:foreground ,green))))
   `(elfeed-search-title-face ((,class (:foreground ,purple))))

   ;; wgrep
   `(wgrep-face ((,class (:foreground ,orange))))
   `(wgrep-reject-face ((,class (:foreground ,red :weight bold :background ,background-red))))
   `(wgrep-done-face ((,class (:foreground ,blue :weight bold))))

   ;; AucTeX
   `(font-latex-math-face ((,class :foreground ,green-light)))
   `(font-latex-sectioning-5-face ((,class :foreground ,blue)))
   `(font-latex-string-face ((,class :inherit font-lock-string-face)))
   `(font-latex-bold-face ((,class :foreground ,green :weight bold)))
   `(font-latex-italic-face ((,class :foreground ,green :slant italic)))
   `(font-latex-warning-face ((,class :inherit warning)))

   ;; Anzu

   `(anzu-replace-highlight ((,class :foreground ,red :background ,background-red :strike-through t)))
   `(anzu-replace-to ((,class :foreground ,green :background ,background-green)))
   `(anzu-match-1 ((,class :foreground ,red :background ,background-red :box t)))
   `(anzu-match-2 ((,class :foreground ,red :background ,background-red :box t)))
   `(anzu-match-3 ((,class :foreground ,red :background ,background-red :box t)))
   `(anzu-mode-line ((,class :inherit mode-line :weight bold)))

   ;; jabber.el
   `(jabber-roster-user-online ((,class :foreground ,blue :weight bold)))
   `(jabber-roster-user-error ((,class :foreground ,red :background ,background-red :weight bold)))
   `(jabber-rare-time-face ((,class :foreground ,comment)))
   `(jabber-chat-prompt-local ((,class :foreground ,purple :background ,background-purple :weight bold)))
   `(jabber-chat-prompt-foreign ((,class :foreground ,green :background ,background-green :weight bold)))
   `(jabber-activity-personal-face ((,class :foreground ,red :background ,background-red :weight bold)))
   `(jabber-roster-user-away ((,class :foreground ,orange)))
   `(jabber-roster-user-xa ((,class :foreground ,orange)))

   ;; ace-window
   `(aw-leading-char-face ((,class :foreground ,red :weight bold)))
   `(aw-background-face ((,class :foreground ,comment)))

   ;; paren-face.el
   `(parenthesis ((,class (:foreground ,comment))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-mismatched-face ((,class :foreground ,red :weight bold :background ,background-red)))
   `(rainbow-delimiters-unmatched-face ((,class :foreground ,red :weight bold :background ,background-red)))

   ;; makefile
   `(makefile-space ((,class (:background ,background-blue))))

   ;; epa
   `(epa-validity-high ((,class (:foreground ,green))))
   `(epa-validity-low ((,class (:foreground ,default))))
   `(epa-validity-disabled ((,class (:foreground ,red :weight bold :background ,background-red))))
   `(epa-field-name ((,class (:foreground ,purple :weight bold))))
   `(epa-field-body ((,class (:foreground ,orange))))

   ;; tabbar
   `(tabbar-default ((,class (:inherit variable-pitch :background ,background-darker :foreground ,green-light :height 0.9))))
   `(tabbar-button ((,class (:inherit tabbar-default ))))
   `(tabbar-button-highlight ((,class (:inherit tabbar-default))))
   `(tabbar-highlight ((,class (:underline t))))
   `(tabbar-selected ((,class (:inherit tabbar-default :foreground ,orange :background ,background :weight bold))))
   `(tabbar-separator ((,class (:inherit tabbar-default :background ,background-darker))))
   `(tabbar-unselected ((,class (:inherit tabbar-default :slant italic :weight semi-bold))))

   ;; markup-face
   `(markup-title-0-face ((,class (:foreground ,blue :weight bold :underline t))))
   `(markup-title-1-face ((,class (:foreground ,purple :weight bold :underline t))))
   `(markup-title-2-face ((,class (:foreground ,peach :weight bold :underline t))))
   `(markup-title-3-face ((,class (:foreground ,green-light :weight bold :underline t))))
   `(markup-title-4-face ((,class (:foreground ,blue :weight bold :underline t))))
   `(markup-title-5-face ((,class (:foreground ,purple :weight bold :underline t))))
   `(markup-error-face ((,class (:foreground ,red :background ,background-red :weight bold))))
   `(markup-gen-face ((,class (:foreground ,blue))))
   `(markup-typewriter-face ((,class (:inherit shadow))))
   `(markup-meta-face ((,class (:foreground ,comment))))
   `(markup-meta-hide-face ((,class (:foreground ,comment))))
   `(markup-verbatim-face ((,class (:inherit shadow :background ,background-lighter))))
   `(markup-reference-face ((,class (:inherit link))))
   `(markup-complex-replacement-face ((,class (:background ,background-green))))
   `(markup-secondary-text-face ((,class (:foreground ,comment))))

   ;; Elbank
   `(elbank-progressbar-fill-face ((,class (:background ,diff-added-refined-background :weight bold))))
   `(elbank-progressbar-overflow-face ((,class (:background ,diff-removed-refined-background :weight bold)))))

  (custom-theme-set-variables
   'omni
   `(ansi-color-names-vector [,background
                              ,red
                              ,green
                              ,orange
                              ,blue
                              ,purple
                              ,blue-dark
                              ,default])))

(defun omni-face-when-active (face)
  "Return FACE if the window is active."
  (when (omni--active-window-p)
    face))

;; So the mode-line can keep track of "the current window"
(defvar omni-selected-window nil
  "Selected window.")

(defun omni--set-selected-window (&rest _)
  "Set the selected window."
  (let ((window (frame-selected-window)))
    (when (and (windowp window)
               (not (minibuffer-window-active-p window)))
      (setq omni-selected-window window))))

(defun omni--active-window-p ()
  "Return non-nil if the current window is active."
  (eq (selected-window) omni-selected-window))


(define-minor-mode omni-mode
  "Enable styles for selected window"
  (if (boundp 'after-focus-change-function) ; emacs-version >= 27.0
      (add-function :before
                    after-focus-change-function
                    #'omni--set-selected-window)
    (with-no-warnings
      (add-hook 'focus-in-hook #'omni--set-selected-window))
    (add-hook 'window-configuration-change-hook #'omni--set-selected-window)
    (advice-add 'select-window :after #'omni--set-selected-window)
    (advice-add 'select-frame  :after #'omni--set-selected-window)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'omni)
(provide 'omni-theme)

;;; omni-theme.el ends here
