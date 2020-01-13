#lang sicp

; 1-21.scm から prime? を用いる.
(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))

(define (next n)
    (if (= n 2)
        3
        (+ n 2)))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (square a)
  (* a a))

; テスト時間報告プログラム
(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

; 指定範囲の連続する奇整数について素数性を調べる手続き
(define (search-for-primes first last)
    (define (init n)
        (if (= (remainder n 2) 0)
            (+ n 1)
            n))
    (define (next n) (+ n 2))
    (define (range-prime-test n last)
        (if (<= n last)
            (timed-prime-test n)
            0)
        (if (<= n last)
            (range-prime-test (next n) last)
            (display " [end] ")))
    (range-prime-test (init first) last))