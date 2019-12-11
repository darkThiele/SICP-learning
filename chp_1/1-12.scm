#lang sicp

; Pascal 三角形の要素の計算
; Input: m, n: 頂点からのレベル(1..), 左からの位置(1..)
; Output: 計算結果

(define (pascal m n)
  (cond ((or (= n 1)
             (= m n)) 1)
        (else (+ (pascal (- m 1) (- n 1))
                 (pascal (- m 1) n)))))