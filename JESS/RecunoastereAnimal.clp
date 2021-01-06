(deftemplate DecisionTree(slot intrebare)(slot raspuns))

(assert (DecisionTree(intrebare nil)(raspuns nil)))
(defrule nivel0
    (DecisionTree(intrebare nil)(raspuns nil))
    =>
    (printout t "It is very big?" crlf)
    (bind ?r (read))
    (assert(DecisionTree(intrebare "It is very big?")(raspuns ?r)))
    )

(defrule nivel1_1
    (DecisionTree (intrebare "It is very big?")(raspuns no))   
    =>
    (printout t "Does it squeak?" crlf)
    (bind ?r (read))
    (assert(DecisionTree(intrebare "Does it squeak?")(raspuns ?r)))
    )

(defrule nivel1_2
    (DecisionTree (intrebare "It is very big?")(raspuns yes))    
    =>
    (printout t " Does it have a long neck?" crlf)
    (bind ?r (read))
    (assert(DecisionTree(intrebare "Does it have a long neck?")(raspuns ?r)))
    )

(defrule nivel2_1
    (DecisionTree(intrebare "Does it squeak?")(raspuns no))   
    =>
    (printout t "Squirrel" crlf) 
    )

(defrule nivel2_2
    (DecisionTree(intrebare "Does it squeak?")(raspuns yes))  
    =>
    (printout t "Mouse" crlf) 
    )

(defrule nivel2_3
    (DecisionTree(intrebare "Does it have a long neck?")(raspuns no))
    =>
    (printout t " Does it have a trunk?" crlf)
    (bind ?r (read))
    (assert(DecisionTree(intrebare "Does it have a trunk?")(raspuns ?r)))

    )

(defrule nivel2_4
    (DecisionTree (intrebare "Does it have a long neck?")(raspuns yes))
    =>
    (printout t "Giraffe" crlf) 
    )

(defrule nivel3_1
    (DecisionTree(intrebare "Does it have a trunk?")(raspuns no))
    =>
    (printout t " Does it like to be in the water?" crlf)
    (bind ?r (read))
    (assert (DecisionTree (intrebare "Does it like to be in the water?")(raspuns ?r)))
    )

(defrule nivel3_2
    (DecisionTree(intrebare "Does it have a trunk?")(raspuns yes))
    =>
    (printout t "Elephant" crlf)

    )

(defrule nivel4_1
    (DecisionTree(intrebare "Does it like to be in the water?")(raspuns no))
    =>
    (printout t "Rhino" crlf)
    )

(defrule nivel4_2
    (DecisionTree(intrebare "Does it like to be in the water?")(raspuns yes))
    =>
    (printout t "Hippo" crlf)

    )

(run)
(facts)


