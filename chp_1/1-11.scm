#lang sicp

; n < 3に対してf(n) = n, n >= 3 に対して f(n) = f(n-1) + 2f(n-2) + 3f(n-3) なる規則で定義する関数 f がある.
; 再帰的プロセスの方法で f を計算する手続き, 反復的プロセスの方法で f を計算する手続きを書け.

; 再帰的プロセス
(define (f n)
    (cond ((< n 3) n)
          (else (+ (f (- n 1))
                   (* 2 (f (- n 2)))
                   (* 3 (f (- n 3)))))))

; 反復的プロセス
; 反復的プロセスの場合, 何らかの不変量を考えることになる. 今回の場合 f(n-1), f(n-2), f(n-3)に対して
; f(n), f(n-1), f(n-2)に置き換えられる a, b, cがあれば十分であろう.

(define (g n)
    (define (g-iter a b c n)
        (cond ((< n 3) n)
              ((= n 3) a)
               (else (g-iter (+ a (* 2 b) (* 3 c))
                              a
                              b
                              (- n 1)))))
    (g-iter 4 2 1 n))

; 再帰的プロセスの方法では(f 35)あたりで結果が返ってこなくなったが(g 35)は余裕である.