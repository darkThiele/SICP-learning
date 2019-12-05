#lang sicp

(define (curt-iter guess x)
  (if (good-enough? guess x)
      guess
      (curt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (/ (abs (- (cube guess) x))
     (cube guess)) 0.001))

(define (cube x)
  (* x x x))

(define (curt x)
  (curt-iter 1.0 x)) 