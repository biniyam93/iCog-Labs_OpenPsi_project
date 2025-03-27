(: is-member (-> (List $t) Number Bool))
(= (is-member Nil $x) False) ;
(= (is-member (Cons $y $ys) $x)
   (if (== $y $x)
       True
       (is-member $ys $x))) ; 

! (is-member (Cons 1 (Cons 2 (Cons 3 Nil))) 2) ; 
! (is-member (Cons 1 (Cons 2 (Cons 3 Nil))) 4) ;