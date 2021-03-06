(deffunction triunghi(?listacoordonate)
    (bind ?x1 (nth$ 1 ?listacoordonate))
    (bind ?x1 (nth$ 2 ?listacoordonate))
    (bind ?x2 (nth$ 3 ?listacoordonate))
    (bind ?x3 (nth$ 4 ?listacoordonate))
    (bind ?x4 (nth$ 5 ?listacoordonate))
    (bind ?x5 (nth$ 6 ?listacoordonate))
    
    (printout t "Coordonatele lui A sunt: x ->" ?x1 "y -> " ?y1 crlf)
    (printout t "Coordonatele lui A sunt: x ->" ?x2 "y -> " ?y2 crlf)
    (printout t "Coordonatele lui A sunt: x ->" ?x3 "y -> " ?y3 crlf)
    
    (bind ?d1 ( sqrt ( + ( ** ( - ?x2 ?x1)( ** ( - ?y2 ?y1)) 2))))
    (bind ?d2 ( sqrt ( + ( ** ( - ?x3 ?x1)( ** ( - ?y3 ?y1)) 2))))
    (bind ?d3 ( sqrt ( + ( ** ( - ?x3 ?x2)( ** ( - ?y3 ?y2)) 2))))
    
    (printout t "Distanta dintre A si B: " ?d1 crlf)
    (printout t "Distanta dintre A si C: " ?d2 crlf)
    (printout t "Distanta dintre B si C: " ?d3 crlf)
    
    (if(or(=(* ?d1 ?d1)(+(* ?d2 ?d2)(* ?d3 ?d3)))
    	  (=(* ?d2 ?d2)(+(* ?d1 ?d1)(* ?d3 ?d3)))
          (=(* ?d3 ?d3)(+(* ?d2 ?d2)(* ?d1 ?d1))))
    
    	then
    		(printout t "Triunghi dereptunghic" crlf)
    		(bind ?b dreptunghic)
    	else
    		(if( = ?d1 ?d2 ?d3)
    			then
        			(printout t "Triunghiul echilateral" crlf)
        			(bind ?b echilateral)
    			else
    				(if( or (= ?d1 ?d2)(= ?d2 ?d3)(= ?d1 ?d3))
    					then
    						(printout t "Triunghi isoscel" crlf)
    						(bind ?b isoscel)
    					else
    						(printout t "Triunghi oarecare" crlf)
    						(bind ?b oarecare))))
	(return ?b)
    )

(deftemplate figuri(slot tipul)(multislot coordonate))
(assert(figuri(tipul trunghi)(coordonate 3 4 2 5 1 6))) ;isoscel
(assert(figuri(tipul trunghi)(coordonate 5 0 -2 4 2 -2))) ;dreptunghic
(assert(figuri(tipul trunghi)(coordonate 2 7 7 2 2 5))) ;oarecare

(defrule solutie
    ?id<-(figuri(tipul triunghi)(coordonate $?listacoordonate))
    	  =>
    	 (bind ?triunghi (triunghi $?listacoordonate))
       	 (modify ?id(tipul ?triunghi))
         (retract ?id) 
         )
    
  (run)
  (facts)