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

;;;###autoload 
(define-generic-mode 'cram-test-mode
  nil
  nil
  '(("^[^ ].*$" . 'font-lock-comment-face)
    ("^ [^ ].*$" . 'font-lock-comment-face)
    ("^  \$ .*$" . 'font-lock-constant-face)
    ("^  > .*$" . 'font-lock-constant-face)
    ("(\\(re\\|glob\\|no-eol\\|esc\\))$" . 'font-lock-keyword-face))
  '("\\.t\\'")
  nil
  "Major mode for Cram tests highlighting.")

(provide 'cram-test-mode)
