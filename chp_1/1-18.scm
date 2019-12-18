#lang sicp

; 対数的ステップ数の乗算手続き
; a' * b' + t = a * b が常に満たされるようなtを不変量とする.
; b が 偶数のとき, a' = 2a b = 1/2 b
; b が 奇数のとき, t += a, b -= 1とする.

(define (* a b)
    (define (mul-iter a b t)
        (cond ((= b 0) t)
              ((even? b) (mul-iter (double a) (halve b) t))
              (else (mul-iter a (- b 1) (+ t a)))))
    (mul-iter a b 0))

; 乗算が定義されていないはずなのでhalveの定義は検討する必要があると思う.
; bitシフトってschemeではどう使うんだ?

(define (double a)
    (+ a a))

(define (halve a)
    (/ a 2))

(define (even? a)
    (= (remainder a 2) 0))