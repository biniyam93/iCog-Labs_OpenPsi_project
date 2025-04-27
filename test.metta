; put you code here
(IsHungry Agent1)
(IsHappy Agent3)
(IsHappy Agent1)

;; Fold a tuple from right to left
(: foldr (-> (-> $a $b $b) $b $c $d))
(= (foldr $f $i $xs)
   (if (== $xs ())
       $i
       (let* (($h (car-atom $xs))
              ($t (cdr-atom $xs))
              ($ft (foldr $f $i $t)))
         ($f $h $ft))))
; ;; Add numbers in an atom list
(= (sum $list) (foldr + 0 $list))
;; Function to count atom occrence in a list of atoms.
(= (count $atom )
(let $list (collapse(find $atom))
   (if (== $list ())
        0
(sum(collapse (if (== $atom (superpose $list)) 1 (empty)))))))

(=(find_evaluation_link $predicate_name)(match &self ($predicate_name $x) ($predicate_name $x)))
(=(find $input)
(let* (($x (find_evaluation_link $input))
        ($y (superpose($x)))
        ($z (car-atom $y)))
        $z))



!(collapse(find IsHappy))

!(count IsHungry)