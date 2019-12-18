#lang sicp

; 逐次平方を用いた, 対数的ステップ数の反復的べき乗プロセスを生成する手続き

; 解答したい問題: (b, n) -> a
(define (square x) (* x x))

(define (expt b n)
    (expt-iter b n 1))

; b^n' * product は常に b^nである.
(define (expt-iter b n product)
    (cond ((= n 0) product)
          ((= (remainder n 2) 0) (expt-iter (square b) (/ n 2) product))
          (else (expt-iter b (- n 1) (* product b)))))