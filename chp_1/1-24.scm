#lang sicp

; fast-prime?手続き
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square a)
  (* a a))

; テスト時間報告プログラム
(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 10)
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