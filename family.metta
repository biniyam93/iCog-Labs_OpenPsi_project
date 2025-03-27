(Male Chandler)
(Female Monica )
(Male John)
(Female Pam)
(Male Adam)
(Female Jane)
(Male Bob)
(Male Tim)
(Female Kim)
(Female Eve)
(Male Joey)

(Parent Chandler John)
(Parent Chandler Pam)
(Parent Chandler Adam)
(Parent Chandler Jane)

(Parent Monica John)
(Parent Monica Pam)
(Parent Monica Adam)
(Parent Monica Jane)

(Parent John Bob)

(Parent Pam Tim)
(Parent Pam Kim)

(Parent Adam Eve)

(Parent Jane Joey)


(=(get-parent $x)(match &self (Parent $y $x) $y))
(=(get-mother $x)(match &self
                (,(Parent $y $x)
                (Female $y))
            $y)
)
(= (get-siblings $person)
   (match &self (Parent $parent $person)
      (match &self (Parent $parent $sibling)
         (if (== $sibling $person)
            (empty)
            $sibling))))


(= (get-male-siblings $person)
   (match &self (Parent $parent $person)
      (match &self (,(Parent $parent $sibling)(Male $sibling))
         (if (== $sibling $person)
            (empty)
            $sibling))))

(= (get-uncles $x)
   (match &self (Parent $y $x)
      (get-male-siblings $y)))  ; 

;; Main Nephew Function
(= (get-nephews $person)
   (match &self (Parent $parent $person)
      (match &self (,(Parent $parent $sibling)(Male $sibling))
         (if (== $sibling $person)
            (empty)
            (match &self (Parent $sibling $x) $x)))))



(= (parent $x $y) (match &self (Parent $x $y) $x))
(= (predecessor $x $z) (parent $x $z))
(= (predecessor $x $z) (predecessor $x (parent $y $z)))

! (get-siblings Pam) ; Returns [John, Adam, Jane] (no repetitions)
!(get-parent John) 
!(get-mother  John)
!(get-siblings John)
!(get-uncles Bob)
!(get-nephews John)
!(predecessor $x Bob)