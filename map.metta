; First define the transformation function
(: increment (-> Number Number))
(= (increment $x) (+ $x 1))

; Then implement map
(: map (-> (-> $a $b) (List $a) (List $b)))
(= (map $_ Nil) Nil)
(= (map $f (Cons $x $xs))
   (Cons ($f $x) (map $f $xs)))

; Usage
! (map increment (Cons 1 (Cons 2 (Cons 3 Nil))))
; Returns (2 3 4)