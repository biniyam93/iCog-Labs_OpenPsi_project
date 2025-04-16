(: remove-duplicates (-> (List $t) (List $t)))
(= (remove-duplicates Nil) Nil)  ; Base case: empty list

(= (remove-duplicates (Cons $x $xs))
   (let $cleaned-xs (remove-duplicates $xs)
   (if (is-member $x $cleaned-xs)
       $cleaned-xs               ; Skip if already exists
       (Cons $x $cleaned-xs))) )  ; Keep if new

; Helper is-member function (simplified)
(= (is-member $_ Nil) False)
(= (is-member $y (Cons $x $xs))
   (if (== $x $y)
       True
       (is-member $y $xs)))

; Test cases
! (remove-duplicates (Cons 1 (Cons 2 (Cons 1 (Cons 3 Nil))))) 
; Returns (1 2 3)
! (remove-duplicates (Cons 'a' (Cons 'b' (Cons 'a' Nil))))
; Returns (a b)
