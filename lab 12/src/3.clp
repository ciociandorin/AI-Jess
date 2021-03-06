(deftemplate goal(slot muta)(slot pe))
(deffacts date_initiale
    (stiva A B C D)
    (stiva E F G)
    (goal(muta C)(pe G))
	)

(reset)
(deffunction afisare(?A ?B)
	(printout t "Muta " ?A " pe " ?B crlf))

;operatii
(defrule push
   	?pv<-(push_value ?v)
    ?s<-(stiva $?rest)
    =>
    (retract ?pv ?s)
    (assert(stiva ?v $?rest))
    (printout t "Val inserata: " ?v crlf)
    )

(defrule pop
   	?pp<-(pop_value ?v)
    ?s<-(stiva ?v $?rest)
    =>
    (retract ?pp ?s)
    (assert(stiva $?rest))
    (printout t "Val suprimata: " ?v "Val ramasa: " $?rest crlf)
    )

(defrule pop
   	?pp<-(push_value ?v)
    (stiva)
    =>
    (retract ?pp ?s)
    (printout t "Stiva este goala" crlf)
    )

;mutari
(defrule mutadirect
    ?g<-(goal(muta ?block1)(pe ?block2))
    ?s1<-(stiva ?block1 $?rest1)
    ?s2<-(stiva ?block2 $?rest2)
    =>
    (retract ?g ?s1 ?s2)
    (assert(stiva $?rest1))
    (assert(stiva ?block1 ?block2 $?rest2))
    )

(defrule muta_pe_masa
    ?g<-(goal(muta ?block1)(pe masa))
    ?s1<-(stiva ?block1 $?rest1)
    =>
    (retract ?g ?s1)
    (assert(stiva $?rest1))
    (assert(stiva $?block1))
    (afisare ?block1 "masa")
    )

(defrule elibereaza_stiva_cu_C
    (goal(pe ?block1))
    (stiva ?top $?x ?block $?y)
    =>
    (assert(goal(muta ?top)(pe masa)))
    )

(defrule elibereaza_stiva_cu_G
    (goal(pe ?block1))
    (stiva ?top $?x ?block $?y)
    =>
    (assert(goal(muta ?top)(pe masa)))
    )

(facts)
(run)
(facts)




