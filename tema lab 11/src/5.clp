;
;  EASTER    A=9, P=0   =>  E9STER
;+   EGGS			  	 	EGGS
;--------			  		--------
;  SPRING			    	S0RING
;
; S = E+1
;
; R = (S + E) % 10
;
; G = (R + S) % 10 
; carry = (R + S) / 10
;
; N = (carry + E + G) % 10
; carry2 = (carry + E + G) / 10
;
; I = (carry2 + T + G) % 10
; carry3 = (carry2 + T + G) / 10
;

(assert(cifra 0)(cifra 1)(cifra 2)(cifra 3)(cifra 4)(cifra 5)
    (cifra 6)(cifra 7)(cifra 8)(cifra 9)
    (litera E)(litera A)(litera S)(litera T)(litera R)
    (litera G)(litera P)(litera I)(litera N))

(deftemplate cripto 
    (slot litera)
    (slot cifra)   
)

(defrule init
    (litera ?l)
    (cifra ?c)
    =>
    (assert(cripto(litera ?l)(cifra ?c)))  
)

(defrule solutie
    (cripto(litera A)(cifra ?a &:(= ?a 9)))
    (cripto(litera P)(cifra ?p &:(= ?p 0)))
    (cripto(litera E)(cifra ?e &~ ?a &~ ?p))
    (cripto(litera S)(cifra ?s &~ ?e &~ ?a &~ ?p &:(= (+ ?e 1) ?s)))
    (cripto(litera R)(cifra ?r &~ ?s &~ ?e &~ ?a &~ ?p &:(= (mod (+ ?s ?e) 10) ?r)))
    (cripto(litera S)(cifra ?s &~ ?r &~ ?p &~ ?a))
    (cripto(litera G)(cifra ?g &~ ?s &~ ?r &~ ?p &~ ?a &:(= (mod (+ ?r ?s) 10) ?g)))
    (cripto(litera N)(cifra ?n &~ ?e &~ ?g &~ ?s &~ ?r &~ ?p &~ ?a &:(= (mod (+ ?e ?g (/ (+ ?r ?s) 10)) 10) ?n)))
    (cripto(litera T)(cifra ?t &~ ?n &~ ?e &~ ?g &~ ?s &~ ?r &~ ?p &~ ?a))
    (cripto(litera I)(cifra ?i &~ ?t &~ ?n &~ ?e &~ ?g &~ ?s &~ ?r &~ ?p &~ ?a &:(= (mod (+ ?t ?g  (/ (+ ?e ?g (/ (+ ?r ?s) 10)) 10)) 10) ?i)))
                        
    =>
    
    (printout t "  " ?e ?a ?s ?t ?e ?r crlf)
    (printout t "+   " ?e ?g ?g ?s crlf)
    (printout t "--------" crlf)
    (printout t "= " ?s ?p ?r ?i ?n ?g crlf)
)

(run)
