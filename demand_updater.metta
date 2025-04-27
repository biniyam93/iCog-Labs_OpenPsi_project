(=(EnergyDemandUpdater $energy) (
    (get_latest_predicate_truth_value_mean ($energy)) 
))

(= (WaterDemandUpdater $thirst)(
    (- 1 $thirst)) 
    ) 


(=(IntegrityDemandUpdater )((get_latest_predicate_truth_value_mean ($fitness)))


(=(fuzzy_new $ts $ti )(
    (/ 2 (+ 1 ((py-atom math.exp)(* 0.002(- $ts $ti)))))
))

;Function from ben paper 
(= (update_certainty $ts $ti $object_num)
(let $uniRand ((py-atom numpy.random.uniform) 0 1)
   (/
    (+ (/ 2 (+ 1 ((py-atom math.exp)(* 0.002(- $ts $ti)))))
       $uniRand )
    (* (+ 1 ((py-atom math.exp) (* (- 0 0.05) $object_num)))
       (+ 1 $object_num))
   )
))

(= (competence $success_count $failure_count)
    (/ $success_count
       (+ $success_count
          ((py-atom math.pow) $failure_count (/ 3 2))
       )
    ))

; function from experement 

(=(competence_demand_updater $done_list $failed_list)
    (let* (($uniRand_done ((py-atom numpy.random.uniform) 0 2))
            (($uniRand_fail ((py-atom numpy.random.uniform) 0 1))
            (= $done (+ (len($done_list))  (+ $uniRand_done 3.0123)))
            (= $fail (+ (len($done_list))  (+ $uniRand_done 0.0123)))
            )
        (/ $done (+ $done ((py-atom math.pow) $fail (/ 3 2))))
    )))

!(fuzzy_new 4 2 )
!(update_certainty 100 90 5)