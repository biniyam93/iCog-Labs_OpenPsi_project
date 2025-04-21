(: fuzzy_equal(-> Number Number Number Number))
(= (fuzzy_equal $x $t $a) 
    (/ 1 (+ 1 (* $a (* (- $x $t) (- $x $t)))))
)

(: fuzzy-less-than (-> Number Number Number Number))
(= (fuzzy-less-than $x $t $a)
   (if (> $x $t)
       (fuzzy_equal $x $t $a)
       1))

(: fuzzy-low (-> Number Number Number Number))
(= (fuzzy-low $x $t $a)
   (fuzzy-less-than $x $t $a))

(: fuzzy-greater-than (-> Number Number Number Number))
(= (fuzzy-greater-than $x $t $a)
   (if (< $x $t)
       (fuzzy_equal $x $t $a)
       1))

(: fuzzy-high (-> Number Number Number Number))
(= (fuzzy-high $x $t $a)
   (fuzzy-greater-than $x $t $a))


(: get-truth-value-mean (-> Expression Number))
(= (get-truth-value-mean ($mean $confidence)) $mean)

(: get-truth-value-confidence (-> Expression Number))
(= (get-truth-value-confidence ( $mean $confidence)) $confidence)