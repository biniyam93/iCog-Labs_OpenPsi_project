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