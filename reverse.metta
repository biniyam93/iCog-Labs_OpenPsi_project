(: reverse (-> (List $t) (List $t)))

; Helper function for reverse-acc
(: reverse-acc (-> (List $t) (List $t) (List $t)))
(= (reverse-acc $acc Nil) $acc)
(= (reverse-acc $acc (Cons $x $xs))
   (reverse-acc (Cons $x $acc) $xs))

; Main reverse function
(= (reverse $lst) (reverse-acc Nil $lst))

; Test cases
! (reverse Nil)  ; Returns Nil
! (reverse (Cons 1 (Cons 2 (Cons 3 Nil))))  ; Returns (Cons 3 (Cons 2 (Cons 1 Nil)))