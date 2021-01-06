(defglobal ?*p* = 100)
(defglobal ?*p1* = 5)

(deftemplate pacient(multislot nume)(slot temp)(slot cul_piele)(slot tusa)(slot sim1)(slot sim2))

(assert(pacient(nume Ion Popescu)(temp 37)(cul_piele buna)(tusa T)(sim1 F)(sim2 F)))
(assert(pacient(nume Blel Kadri)(temp 39)(cul_piele palid)(tusa T)(sim1 T)(sim2 F)))
(assert(pacient(nume Marius Ramiant)(temp 38)(cul_piele buna)(tusa T)(sim1 T)(sim2 T)))
(assert(pacient(nume Tom Ford)(temp 40)(cul_piele palid)(tusa T)(sim1 T)(sim2 T)))
(assert(pacient(nume Ciprian Teletin)(temp 36)(cul_piele buna)(tusa F)(sim1 F)(sim2 F)))



(defrule raceala
    (declare(salience ?*p*))
    (pacient (nume $?pac){
        temp == 37 && cul_piele == buna && sim1 == F
    })
    	=>
    (printout t "Pacientul: " $?pac " este racit." crlf)
        
    )


(defrule gripa
    (declare(salience ?*p1*))
    (pacient (nume $?pac){
        temp >= 38 && cul_piele == palid && sim1 == T
    })
    	=>
    (printout t "Pacientul: " $?pac " este gripat." crlf)
        
    )

(defrule covid
    (declare(salience 50))
    (pacient (nume $?pac){
        temp >= 39 && cul_piele == palid && sim2 == T
    })
    	=>
    (printout t "Pacientul: " $?pac " are covid." crlf)
        
    )

(defrule hiv
    (declare(salience 20))
    (pacient (nume $?pac){
        temp >= 38 && tusa == T && sim1 == T && sim2 == F
    })
    	=>
    (printout t "Pacientul: " $?pac " are hiv." crlf)
        
    )

(run)
