
(deffacts date 
	(multime A 1 3 5 7 9)
    (multime B 2 4 6 8)
    (reuniune AB)    
)
(reset)

(deftemplate suma(slot sum))
(assert(suma(sum 0)))

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

(defrule suma
    ?idvs <- (suma(sum ?vs))
    ?idve <- (reuniune ?A ?p $?rest)
    
	=>    
    (retract ?idve)
    (modify ?idvs (sum(+ ?vs ?p)))
    (assert(reuniune ?A $?rest))
    
)

(run)
(facts)


















