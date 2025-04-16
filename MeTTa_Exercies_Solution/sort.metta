(: insert (-> $t (List $t) (List $t)))
(= (insert $x Nil) (Cons $x Nil))
(= (insert $x (Cons $y $ys))
   (if (< $x $y)
       (Cons $x (Cons $y $ys))
       (Cons $y (insert $x $ys))))

(: sort (-> (List Number) (List Number)))
(= (sort Nil) Nil)
(= (sort (Cons $x $xs)) (insert $x (sort $xs)))

! (sort (Cons 3 (Cons 1 (Cons 4 (Cons 2 Nil)))))  ; Returns (1 2 3 4)
