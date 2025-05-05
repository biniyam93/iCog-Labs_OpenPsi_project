;ti is the latest time stamp of observing object i 
;ts is the current time stamp of the virtual world.

;(=(fuzzy_new $ts $ti )(
    ;(/ 2 (+ 1 ((py-atom math.exp)(* 0.002(- $ts $ti)))))
;))

;Function from ben paper 

;(= (certaint_level $ts $ti $object_num)
;(let $uniRand ((py-atom numpy.random.uniform) 0 1)
;  (/
;  (+ (/ 2 (+ 1 ((py-atom math.exp)(* 0.002(- $ts $ti)))))
;    $uniRand )
;(* (+ 1 ((py-atom math.exp) (* (- 0 0.05) $object_num)))
;  (+ 1 $object_num))
;)
;))

; function from embodiment 

(=(competence_demand_updater $done_list $failed_list)
    (let* (($uniRand_done ((py-atom numpy.random.uniform) 0 2))
            (($uniRand_fail ((py-atom numpy.random.uniform) 0 1))
            (= $done (+ (len($done_list))  (+ $uniRand_done 3.0123)))
            (= $fail (+ (len($done_list))  (+ $uniRand_done 0.0123)))
            )
        (/ $done (+ $done ((py-atom math.pow) $fail (/ 3 2))))
    )))

(=(certainty_demand_updater)
(let* (($changes_with_tv (match &demandspace (changes_with_tv $x ) $x))
      ($changes_with_arg (match &demandspace (changes_with_arg $x ) $x))
      ($change_with_tv_level  0)
      ($change_with_arg_level  0)
      ($len_tv (len($changes_with_tv)))
      ($random_noise_tv (+ $len_tv  (* 20  ((py-atom numpy.random.uniform) 0 1))))
      ($random_noise_tv_2 (+ $len_tv (* 20  ((py-atom numpy.random.uniform) 0 1)))))
      
   (/ 1 (+ 1 (* 0.001 (* $random_noise_tv $random_noise_tv_2))))

))


