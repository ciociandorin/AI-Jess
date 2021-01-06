(deffunction triunghi($?coordonate)
	(bind ?x1 (nth$ 1 ?coordonate)) ;extrage elementul de pe pozitia intai    
    (bind ?y1 (nth$ 2 ?coordonate)) 
    (bind ?x2 (nth$ 3 ?coordonate)) ;extrage elementul de pe pozitia a treia 
    (bind ?y2 (nth$ 4 ?coordonate))
    (bind ?x3 (nth$ 5 ?coordonate)) ;extrage elementul de pe pozitia a cincea 
    (bind ?y3 (nth$ 6 ?coordonate))
    
    (printout t "Coordonatele lui A sunt: x="?x1 ", y="?y1 crlf)
    (printout t "Coordonatele lui B sunt: x="?x2 ", y="?y2 crlf)
    (printout t "Coordonatele lui C sunt: x="?x3 ", y="?y3 crlf)
    
    (bind ?d1 (sqrt(+ (**(- ?x2 ?x1)2)(**(- ?y2 ?y1)2) ) ))
    (bind ?d2 (sqrt(+ (**(- ?x3 ?x1)2)(**(- ?y3 ?y1)2) ) ))
    (bind ?d3 (sqrt(+ (**(- ?x3 ?x2)2)(**(- ?y3 ?y2)2) ) ))
    
    (printout t "Distanta dintre A si B este " ?d1 crlf)
    (printout t "Distanta dintre A si C este " ?d2 crlf)
    (printout t "Distanta dintre B si C este " ?d3 crlf)
    
    (if (or (= (* ?d1 ?d1)(+ (* ?d2 ?d2)(* ?d3 ?d3)))
    		(= (* ?d2 ?d2)(+ (* ?d1 ?d1)(* ?d3 ?d3)))
            (= (* ?d3 ?d3)(+ (* ?d2 ?d2)(* ?d1 ?d1)))
    ) then
    		(printout t "Triunghiul este dreptunghic" crlf)
    		(bind ?t dreptunghic)
    else (if (= ?d1 ?d2 ?d3) then
        	(printout t "Triunghi echilateral" crlf)
        	(bind ?t echilateral)
		else(if (or (= ?d1 ?d2)(= ?d2 ?d3)(= ?d3 ?d1))
            then (printout t "Triunghi isoscel" crlf)
            (bind ?t isoscel)
        else(printout t "Triunghi oarecare" crlf)
            (bind ?t oarecare)
            
            )
        )       
        
    )
	(return ?t)  
)


(deftemplate triunghi(slot tip)(multislot coordonate))
(assert(triunghi(tip triunghi)(coordonate 2 7 7 2 2 5))) ;oarecare
(assert(triunghi(tip triunghi)(coordonate 3 4 2 5 1 6))) ;isoscel
(assert(triunghi(tip triunghi)(coordonate 5 0 -2 4 2 -2))) ;oarecare

(defrule determina_tip_triunghi
	?x <- (triunghi(tip ?t)(coordonate $?coordonate))
    =>    
    (bind ?tip (triunghi $?coordonate))
    (modify ?x (tip ?tip))
    (retract ?x)
)

(run)
(facts)



