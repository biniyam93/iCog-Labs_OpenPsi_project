(: remove-element (-> $t (List $t) (List $t)))
(= (remove-element $_ Nil) Nil)  ; Base case: empty list returns empty list
(= (remove-element $y (Cons $x $xs))
   (if (== $x $y)
       $xs  ; Found match - return rest of list
       (Cons $x (remove-element $y $xs))))  ; Keep current element and continue

! (remove-element 5 (Cons 5 Nil))  ; Returns Nil
! (remove-element 2 (Cons 1 (Cons 2 (Cons 3 Nil))))  ; Returns (1 3)
! (remove-element 4 (Cons 1 (Cons 2 Nil)))  ; Returns (1 2) - no change
