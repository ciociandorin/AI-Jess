(deffacts date 
	(multime A 1 3 5 7 9)
    (multime B 2 4 6 8)
    (reuniune AB)    
)
(reset)

(deftemplate cardinal(slot s))
(assert(cardinal(s 0)))

(defrule descompunere
    ?x<-(multime ?A ?p $?rest)
    (test(not(eq ?p nil)))
	=>    
    (retract ?x)
    (assert(element ?p))
    (assert(multime ?A $?rest))
)

(defrule reuniune
    ?x <- (element ?p)
    ?y <- (reuniune ?A $?rest)
	=>    
    (retract $?x $?y)
    (assert(reuniune ?A ?p $?rest))
    
)

(defrule cardinal
    ?idvs <- (cardinal(s ?vs))
    ?idve <- (reuniune ?A ?p $?rest)
    
	=>    
    (retract ?idve)
    (modify ?idvs (s(+ ?vs 1)))
    (assert(reuniune ?A $?rest))
    
)

(run)
(facts)