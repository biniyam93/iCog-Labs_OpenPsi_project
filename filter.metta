 First define the predicate function
(: is-even (-> Number Bool))
(= (is-even $x) (== (% $x 2) 0))

; Then implement filter
(: filter (-> (-> $t Bool) (List $t) (List $t)))
(= (filter $_ Nil) Nil)
(= (filter $pred (Cons $x $xs))
   (if ($pred $x)
       (Cons $x (filter $pred $xs))
       (filter $pred $xs)))

; Usage
! (filter is-even (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))