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

;; Define helper functions first
(= (get-parents $person)
   (match &self (Parent $parent $person) $parent))

(= (male $person)
   (match &self (Male $person) $person))

(= (get-siblings $person)
   (match &self (Parent $parent $person)
      (match &self (Parent $parent $sibling)
         (if (== $sibling $person)
            (empty)
            $sibling))))

;; Main uncle function
(= (get-uncles $person)
   (match &self (Parent $parent $person)  ; Find all parents
      (let (($parent-siblings (get-siblings $parent)))  ; Get their siblings
         (filter male $parent-siblings))))  ; Keep only male siblings

;; Example usage with your family data:
! (get-uncles Pam)  ; Returns uncles of Pam