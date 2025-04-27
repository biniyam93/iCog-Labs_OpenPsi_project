;; Activation Modulator Updater in MeTTa
(: ActivationModulatorUpdater (-> Number))

(= (ActivationModulatorUpdater)
   (let* (($competence (get-truth-value-mean ( CompetenceDemandGoal)))
         ($energy (get-truth-value-mean (EnergyDemandGoal)))
         ($stimulus (get-predicate-truth-value-mean (ActivationStimulus))))
   (+ (* 2 $stimulus)
      (* (/ $competence (+ $competence 0.5))
         (/ $energy (+ 0.05 $energy))))))
         

;; Resolution Modulator Updater in MeTTa
(: ResolutionModulatorUpdater (-> Number))

(= (ResolutionModulatorUpdater)
   (let $stimulus (get-predicate-truth-value-mean(ResolutionStimulus))
     (+ (* 2 $stimulus)
        (- 1
           ((py-atom math.pow) (get-predicate-truth-value-mean (ActivationModulator)) 0.5)))))


;; Securing Threshold Modulator Updater in MeTTa
(: SecuringThresholdModulatorUpdater (-> Number))
(= (SecuringThresholdModulatorUpdater)
   (let* (($certainty (get-truth-value-mean (CertaintyDemandGoal)))
        ($integrity (get-truth-value-mean (IntegrityDemandGoal)))
        ($stimulus (get-predicate-truth-value-mean (SecuringThresholdStimulus))))
   (+ (* 2 $stimulus)
      ((py-atom math.pow) $integrity 3))))


;; Selection Threshold Modulator Updater in MeTTa
(: SelectionThresholdModulatorUpdater (-> Number))

(= (SelectionThresholdModulatorUpdater)
   (let* (($competence (get-truth-value-mean (CompetenceDemandGoal)))
         ($stimulus (get-predicate-truth-value-mean (SelectionThresholdStimulus))))
     (+ (* 2 $stimulus)
        (fuzzy-equal $competence 1 15))))

