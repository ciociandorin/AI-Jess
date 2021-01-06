(deftemplate zboruri(slot sursa) (slot destinatie) (slot distanta))

(assert(zboruri(sursa NY)(destinatie Syracuse)(distanta 350)))
(assert(zboruri(sursa NY)(destinatie Toronto)(distanta 850)))
(assert(zboruri(sursa NY)(destinatie Chicago)(distanta 928)))
(assert(zboruri(sursa NY)(destinatie Indianapolis)(distanta 1078)))
(assert(zboruri(sursa NY)(destinatie Denver)(distanta 1500)))
(assert(zboruri(sursa Denver)(destinatie Memphis)(distanta 1280)))
(assert(zboruri(sursa Denver)(destinatie Houston)(distanta 2079)))
(assert(zboruri(sursa Denver)(destinatie LA)(distanta 1010)))
(assert(zboruri(sursa Houston)(destinatie LA)(distanta 1235)))
(assert(zboruri(sursa Toronto)(destinatie Victoria)(distanta 3450)))
(assert(zboruri(sursa Toronto)(destinatie Milwaukee)(distanta 579)))
(assert(zboruri(sursa Toronto)(destinatie LA)(distanta 4005)))
(assert(zboruri(sursa Toronto)(destinatie Chicago)(distanta 980)))
(assert(zboruri (sursa Chicago)(destinatie Denver)(distanta 3116)))

(facts)

(defrule sursaNY
    (zboruri(sursa NY)(destinatie ?d)(distanta ?dist))
    =>
    (printout t "Din NY ajungem la: " ?d ", avand " ?dist " km " crlf)
    )

(run)

(defrule dist800-2200km
    (zboruri(sursa ?s)(destinatie ?d)(distanta ?dist){
    	distanta > 800 && distanta < 2200
    })
    =>
    (printout t "Distanta intre " ?s " si " ?d " este de " ?dist " km" crlf))

(run)

