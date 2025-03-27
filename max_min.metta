: max-value (-> (List Number) Number))
(= (max-value Nil) -infinity)  ; Base case: empty list returns negative infinity
(= (max-value (Cons $x $xs))
   (let $max-rest (if (== $xs Nil)  ; Check if rest is empty
                     $x
                     (max-value $xs))  ; Otherwise recurse
    
   (if (< $x $max-rest)  ; Compare current with max of rest
       $x
       $max-rest)))

! (max-value (Cons 1 (Cons 2 Nil))) ; 2
! (max-value (Cons 3 (Cons 1 Nil))) ; 3
! (max-value (Cons 5 (Cons 2 (Cons 8 Nil)))) ; 8
! (max-value Nil) ; -infinity
