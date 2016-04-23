;;; cram-test-mode.el --- highlight mode for Cram tests

;; Copyright (c) 2016 Miron Moderau

;; Author: Miron Moderau <em3@minions.org.pl>
;; Keywords: cram-tests
;; URL: http://github.com/macmodrov/cram-test-mode

;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;; This major mode provides basic syntax higlighting for Cram framework test
;; files. Cram framework can be found at:
;; <http://github.com/myint/cram>

(defvar cram-test-ouput-keywords
  '("(re)" "(glob)" "(no-eol)" "(esc)"))

(defvar cram-test-font-lock-defaults
  `((("^  \\(\\$\\) +\\(\"[^\"]+\"\\|[^ \n]+\\)\\( +\\(.*?\\)\\)??$"
      (1 font-lock-builtin-face) ;; The $ sign
      (2 font-lock-function-name-face) ;; The command
      (4 font-lock-constant-face)) ;; The parameters
     ("^  \\(>\\) +\\(.*\\)$"
      (1 font-lock-builtin-face) ;; The > sign
      (2 font-lock-constant-face)) ;; The parameters
     ("^ ?[^ \n].*$" . 'font-lock-comment-face)
     (,(concat (regexp-opt cram-test-ouput-keywords) "$") . 'font-lock-keyword-face))))

;;;###autoload
(define-derived-mode cram-test-mode fundamental-mode "Cram test"
  "Major mode for Cram tests highlighting."
  (setq font-lock-defaults cram-test-font-lock-defaults)
  (set (make-local-variable 'font-lock-string-face) nil)
  (set (make-local-variable 'tab-width) 2)
)

(provide 'cram-test-mode)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.t\\'" . cram-test-mode))
