(deftemplate persoana
    (multislot nume)
    (multislot mama)
    (multislot tata)
    (multislot partener))

(assert(persoana(nume Ion Popescu)(mama Daniela Popescu)(tata Ioan Popescu)(partener Maria Popescu)))
(assert(persoana(nume Dan Popescu)(mama Daniela Popescu)(tata Ioan Popescu)(partener nil)))
(assert(persoana(nume Maria Popescu)(mama Ionela X)(tata Georgel Y)(partener nil)))
(assert(persoana(nume Ioana X)(mama Ionela Y)(tata Georgel Y)(partener nil)))
(assert(persoana(nume Cristian Popescu)(mama Maria Popescu)(tata Ion Popescu)(partener Elena Popescu)))
(assert(persoana(nume Adrian Popescu)(mama Maria Popescu)(tata Ion Popescu)(partener Cristina Popescu)))
(assert(persoana(nume Ciprian Popescu)(mama Maria Popescu)(tata Ion Popescu)(partener Adriana Popescu)))
(assert(persoana(nume Maria Andreescu)(mama Maria Popescu)(tata Ion Popescu)(partener Petre Andreescu)))
(assert(persoana(nume Petre Andreescu)(mama Georgica Andreescu)(tata George Andreescu)(partener Maria Andreescu)))
(assert(persoana(nume Ionel Andreescu)(mama Maria Andreescu)(tata Petre Andreescu)(partener nil)))
(assert(persoana(nume Tudor Popescu)(mama Cristina Popescu)(tata Adrian Popescu)(partener nil)))


(facts)

(defrule bunici
    (persoana(nume $?x)(mama $?m)(tata $?t))
    (persoana(nume $?m)(mama $?m1)(tata $?t1))
    (persoana(nume $?t)(mama $?m2)(tata $?t2))
    =>
    (printout t $?m1 "," $?t1 "," $?m2 "," $?t2 crlf)
    )


(defrule frate_sora
    (persoana(nume $?x)(mama $?m)(tata $?t))
    (persoana(nume $?h)(mama $?m)(tata $?t))
    =>
    (if (neq $?x $?h) then (printout t $?x " -> " $?h crlf)))

(defrule verisori/verisoara
    (persoana (nume $?x1)(mama $?m1)(tata $?t1))
    (persoana (nume $?x2)(mama $?m1)(tata $?t1))
    
    (and
        
    (or
    (persoana (nume $?x3)(mama $?x1))         
    (persoana (nume $?x3)(tata $?x1)))
         
    (or	
    (persoana (nume $?x4)(mama $?x2))    	
    (persoana (nume $?x4)(tata $?x2)) 
    ))
    => 
    (printout t $?x3 "        " $?x4 crlf)
    )
(run)

