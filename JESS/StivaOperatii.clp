(deftemplate goal(slot muta)(slot pe))

(deffacts date
	(stack A B C D)
    (stack E F G)
    (goal(muta C)(pe G) )       
)
(reset)

;operatii de baza pe stive

(defrule push
	?x<-(push_value ?pv)
    ?y<-(stack $?rest)
    =>
    (retraxt ?x ?y)
    (assert(stack ?pv $?rest))   
    (printout t "Valoarea adaugata este " ?pv crlf) 
)

(defrule pop
	?x <- (pop_value)
    ?y <- (stack ?pv $?rest)  
    =>
    (retract ?x ?y)
    (asssert(stack $?rest))
    (printout t "Valoarea suprimata este " ?pv crlf)
)

(defrule pop_invalid
	?x <- (pop_value)
    ?y <- (stack)  
    =>
    (retract ?x ?y)
    (printout t "Stiva este goala! " crlf)
)

;mutari
(defrule muta-direct
    ?g<-(goal(muta ?block1)(pe ?block2))
    ?s1<-(stack ?block1 $?rest1)
    ?s2<-(stack ?block2 $?rest2)
	=>    
    (retract ?g ?s1 ?s2)
    (assert(stack $?rest1))
    (assert(stack ?block1 ?block2 $?rest2))   
)

(defrule muta-pe-masa
    ?g<-(goal(muta ?block1)(pe ?block2))
    ?s1<-(stack ?block1 $?rest1)
	=>    
    (retract ?g ?s1)
    (assert(stack $?rest1))
    (assert(stack $?block1))
)

(defrule eliberare-stiva-cu-C
    (goal (muta ?block1))
    (stack ?top $?x ?block1 $?y)
	=>    
    (assert(goal(muta ?top)(pe masa)))   
)

(defrule eliberare-stiva-cu-G
    (goal (pe ?block1))
    (stack ?top $?x ?block1 $?y)
	=>    
    (assert(goal(muta ?top)(pe masa)))   
)
(facts)
(run)
(facts)
