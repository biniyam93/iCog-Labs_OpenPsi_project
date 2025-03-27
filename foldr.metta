(: foldr (-> (-> $a $b $b) $b (List $a) $b))
(= (foldr $_ $acc Nil) $acc)
(= (foldr $f $acc (Cons $x $xs))
   ($f $x (foldr $f $acc $xs)))

! (foldr + 0 (Cons 1 (Cons 2 (Cons 3 Nil))))  ; Returns 6
! (foldr Cons Nil (Cons 1 (Cons 2 Nil)))  ; Returns (1 2)
