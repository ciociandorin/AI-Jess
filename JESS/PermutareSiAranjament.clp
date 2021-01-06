
(deffacts date
    (item 1 2 3)
    (dimensiune 3)
    
    )
(reset)

(defrule init
    (item $? ?x $?)
    =>
    (assert(aranjament ?x))
    
    )

(defrule initPerm
    (item $? ?y $?)
	=>
    (assert(permutari ?y))
)

(defrule solutie-aranjamente
    (dimensiune ?k)
    (aranjament $?x &:(< (length$ $?x) ?k))
    (item $? ?e &:(not(member$ ?e $?x))$?)
    =>
    (assert(aranjament ?e $?x))
    )

(defrule solutie-permutari
	(dimensiune ?k)
    (permutari $?y &:(< (length$ $?y) ?k))
    (item $? ?e &:(member$ ?e $?y)$?)
    =>
    (assert(permutari ?e $?y))
)

(defrule afisare 
    (dimensiune ?k)
    (aranjament $?x &:(= (length$ $?x) ?k))
    =>
    (printout t $?x crlf)
    )

(defrule afisarePerm
    (dimensiune ?k)
    (permutari $?y &:(= (length$ $?y) ?k))
	=>
    (printout t $?y crlf)
)

(run)







