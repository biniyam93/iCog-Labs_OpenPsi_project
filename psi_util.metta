(: fuzzy_equal(-> Number Number Number))
(= (fuzzy_equal $x $t $a) (
    (/ 1 (+ 1 (* a (- x t) (- x t))))
))


(: get-truth-value-mean (-> Expression Number))
(= (get-truth-value-mean ($mean $confidence)) $mean)

(: get-truth-value-confidence (-> Expression Number))
(= (get-truth-value-confidence ( $mean $confidence)) $confidence)