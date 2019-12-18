#lang sicp

; 対数的ステップ数の乗算手続き
; 再帰的プロセスを持つような設計

(define (* a b)
    (cond ((= b 0) 0)
          ((even? b) (double (* a (halve b))))
          (else (+ a (* a (- b 1))))))

; 乗算が定義されていないはずなのでhalveの定義は検討する必要があると思う.
; bitシフトってschemeではどう使うんだ?

(define (double a)
    (+ a a))

(define (halve a)
    (/ a 2))

(define (even? a)
    (= (remainder a 2) 0))