(: append (-> (List $t) (List $t) (List $t)))
(= (append Nil $ys) $ys) ; Appending Nil to ys gives ys
(= (append (Cons $x $xs) $ys) (Cons $x (append $xs $ys))) ; Append x:xs to ys
! (append (Cons 1 (Cons 2 Nil)) (Cons 3 (Cons 4 Nil))) ; [1, 2, 3, 4]
