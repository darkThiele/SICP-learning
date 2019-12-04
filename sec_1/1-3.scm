#lang sicp

(define (test)
  (and (= (big-two-squares 1 2 3) 13)
       (= (big-two-squares 2 1 3) 13)
       (= (big-two-squares 3 1 2) 13)
       (= (big-two-squares -5 4 3) 25)))

(define (big-two-squares a b c)
  (cond ((and (< a b)
             (< a c)) (+ (square b)
                         (square c)))
        ((and (< b c)
              (< b a)) (+ (square a)
                          (square c)))
        ((and (< c a)
              (< c b)) (+ (square a)
                          (square b)))))

(define (square a)
  (* a a))