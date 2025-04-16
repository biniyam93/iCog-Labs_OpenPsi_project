(: length (-> (List $t) Number))
(= (length Nil) 0) ; Length of an empty list is 0
(= (length (Cons $x $xs)) (+ 1 (length $xs))) ; Length of (Cons x xs) is 1 + length of xs
! (length (Cons 1 (Cons 2 (Cons 3 Nil)))) ; 3




