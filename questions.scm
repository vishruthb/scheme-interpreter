(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  (if (null? pairs)
      (cons '() '())
      (let ((first (car pairs))
            (rest (zip (cdr pairs))))
        (cons (cons (car first) (car rest))
              (cons (cdr first) (cdr rest))))))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  'replace-this-line
   (define (helper s idx)
    (if (null? s)
        '()
        (cons (list idx (car s)) (helper (cdr s) (+ idx 1)))))
  (helper s 0))
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond ((null? list1) list2)
        ((null? list2) list1)
        ((comp (car list1) (car list2))
         (cons (car list1) (merge comp (cdr list1) list2)))
        (else (cons (car list2) (merge comp list1 (cdr list2))))))
  ; END PROBLEM 16


;; Problem 17

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr) expr)
        ((quoted? expr) expr)
        ((lambda? expr)
         (let ((form (car expr))
               (params (cadr expr))
               (body (cddr expr)))
           (cons form (cons params (map let-to-lambda body)))))
        ((define? expr)
         (let ((form (car expr))
               (name-and-params (cadr expr))
               (body (cddr expr)))
           (cons form (cons name-and-params (map let-to-lambda body)))))
        ((let? expr)
         (let ((values (cadr expr))
               (body (cddr expr)))
           (let ((params (map car values))
                 (args (map cadr values)))
             (cons (cons 'lambda (cons params (map let-to-lambda body)))
                   (map let-to-lambda args)))))
        (else (map let-to-lambda expr))))