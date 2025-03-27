(: foldl (-> (-> $a $b $a) $a (List $b) $a))
(= (foldl $_ $acc Nil) $acc)
(= (foldl $f $acc (Cons $x $xs))
   (foldl $f ($f $acc $x) $xs))

! (foldl + 0 (Cons 1 (Cons 2 (Cons 3 Nil))))  ; Returns 6


(: reverse (-> (List $t) (List $t)))
(= (reverse $lst) (foldl (lambda (acc x) (Cons x acc)) Nil lst))

! (reverse (Cons 1 (Cons 2 (Cons 3 Nil))))  ; Returns (3 2 1)