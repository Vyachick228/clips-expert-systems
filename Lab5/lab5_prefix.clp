; Laboratory work 5. General task: infix to prefix expressions.
; Each expression below is written in CLIPS prefix notation.

(deffunction expression-a ()
    (+ (* (+ 3 4) (+ 5 6)) 7)
)

(deffunction expression-b ()
    (- (* 5 (+ 5 6 7))
       (/ (+ (* 3 (/ 4 9)) 2) 8))
)

(deffunction expression-c ()
    (- (+ (- 6 (/ (* 9 8) 3)) 4)
       (/ (* (- (- 8 2) 3) 6) 7))
)

(defrule print-prefix-results
    (initial-fact)
    =>
    (printout t "a) (+ (* (+ 3 4) (+ 5 6)) 7)" crlf)
    (printout t "Result a: " (expression-a) crlf)
    (printout t "b) (- (* 5 (+ 5 6 7)) (/ (+ (* 3 (/ 4 9)) 2) 8))" crlf)
    (printout t "Result b: " (expression-b) crlf)
    (printout t "c) (- (+ (- 6 (/ (* 9 8) 3)) 4) (/ (* (- (- 8 2) 3) 6) 7))" crlf)
    (printout t "Result c: " (expression-c) crlf)
)
