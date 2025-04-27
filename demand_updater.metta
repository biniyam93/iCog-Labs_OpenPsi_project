(=(EnergyDemandUpdater) (
    (get_latest_predicate_truth_value_mean (energy)) 
))

(= (WaterDemandUpdater)(
    (- 1
       (get_latest_predicate_truth_value_mean (thirst)) 
    ) 
))    

(=(IntegrityDemandUpdater)(
    (get_latest_predicate_truth_value_mean (fitness))
))

(=(fuzzy_new $ts $ti )(
    (/ 2 (+ 1 ((py-atom math.exp)(* 0.002(- $ts $ti)))))
))

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


!(fuzzy_new 4 2 )
!(update_certainty 100 90 5)