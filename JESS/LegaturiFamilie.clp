(deftemplate Persoana(multislot nume)(multislot partener)(multislot mama)(multislot tata))

(assert(Persoana(nume Ion Popescu)(partener Maria Popescu)(mama Daniela Popescu)(tata Ioan Popescu)))
(assert(Persoana(nume Dan Popescu)(partener nil)(mama Daniela Popescu)(tata Ioan Popescu)))
(assert(Persoana(nume Maria Popescu)(partener Ion popescu)(mama Ionela X)(tata Georgel Y)))
(assert(Persoana(nume Ioana X)(partener nil)(mama Ionela X)(tata Georgel Y)))

(assert(Persoana(nume Cristian Popescu)(partener Elena Popescu)(mama Maria Popescu)(tata Ion Popescu)))
(assert(Persoana(nume Adrian Popescu)(partener Cristina Popescu)(mama Maria Popescu)(tata Ion Popescu)))
(assert(Persoana(nume Ciprian Popescu)(partener Adriana Popescu)(mama Maria Popescu)(tata Ion Popescu)))
(assert(Persoana(nume Maria Andreescu)(partener Petre Andreescu)(mama Maria Popescu)(tata Ion Popescu)))

(assert(Persoana(nume Ionel Andreescu)(partener nil)(mama Maria Andreescu)(tata Petre Andreescu)))

(assert(Persoana(nume Elena Popescu)(partener Cristian Popescu)(mama nil)(tata nil)))
(assert(Persoana(nume Cristina Popescu)(partener Adrian Popescu)(mama nil)(tata nil)))
(assert(Persoana(nume Adriana Popescu)(partener Ciprian Popescu)(mama nil)(tata nil)))
(assert(Persoana(nume Tudor Popescu)(partener nil)(mama Cristina Popescu)(tata Adrian Popescu)))
(assert(Persoana(nume Petre Andreescu)(partener Maria Andreescu)(mama nil)(tata nil)))

/*(defrule bunici 
    (Persoana(nume $?x)(mama $?m)(tata $?t))
    (Persoana(nume $?m)(mama $?m1)(tata $?t1))
    (Persoana(nume $?t)(mama $?m2)(tata $?t2))
    =>
    (printout t $?x " are bunici pe " $?m1", "$?t1", "$?m2", "$?t2 crlf)
)
(run)

(defrule frate/sora
    (Persoana(nume $?x)(mama $?m)(tata $?t))
    (Persoana(nume $?h)(mama $?m)(tata $?t))    
    =>
    (if(neq $?x $?h) then (printout t $?x " este frate/sora cu " $?h crlf))
)
(run)


(defrule unchi/matusa
    (Persoana(nume $?c)(mama $?m)(tata $?t))
    (Persoana(nume $?m)(mama $?m1)(tata $?t1))    
    (Persoana(nume $?h)(mama $?m1)(tata $?t1))   
    (Persoana(nume $?t)(mama $?m2)(tata $?t2))
    (Persoana(nume $?h2)(mama $?m2)(tata $?t2))
    =>
    (if ( and (neq $?m $?h)(neq $?t $?h2)) then (printout t $?c " are unchi/matusa pe " $?h ", " $?h2 crlf))
)
(run)
*/

(defrule verisor/verisoara
    (Persoana(nume $?c)(mama $?m)(tata $?t))
    (Persoana(nume $?m)(mama $?m1)(tata $?t1))    
    (Persoana(nume $?h)(mama $?m1)(tata $?t1))   
	(Persoana(nume $?ver)(mama $?alta)(tata $?h))   
    =>
    (if(neq $?m $?h) then (printout t $?c " are verisor/verisoara pe " $?ver crlf))
)
(run)




(facts)