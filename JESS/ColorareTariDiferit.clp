
(deftemplate mapa(slot tara)(slot culoare))

(assert (tara Brazil)(tara FrenchGuiana)(tara Suriname)(tara Guyana)(tara Venezuela)
    	(tara Colombia)(tara Ecuador)(tara Peru)(tara Bolivia)
        (tara Chile)(tara Argentina)(tara Paraguay)(tara Uruguay)
    	(culoare indigo)(culoare alb)(culoare galben)(culoare verde)
)

(defrule init
    (tara ?t)
    (culoare ?c)
    =>
    (assert (mapa (tara ?t)(culoare ?c)))
)


(defrule solutie
    (mapa (tara Brazil)(culoare ?br&: (= galben ?br)))
    (mapa (tara FrenchGuiana)(culoare ?fg &~ ?br))
	(mapa (tara Suriname)(culoare ?su &~ ?fg &~ ?br))
    (mapa (tara Guyana)(culoare ?gu &~ ?su &~ ?br))
    (mapa (tara Venezuela)(culoare ?ve &~ ?gu &~?br))
    (mapa (tara Colombia)(culoare ?co &~ ?ve &~ ?br))
    (mapa (tara Ecuador)(culoare ?ec &~ ?co))
    (mapa (tara Peru)(culoare ?pe &~ ?ec &~ ?co &~ ?br))
    (mapa (tara Bolivia)(culoare ?bo &~ ?pe &~ ?br))
    (mapa (tara Chile)(culoare ?ch &~ ?pe &~ ?bo))
    (mapa (tara Argentina)(culoare ?ar &~ ?bo &~?ch &~ ?br))
	(mapa (tara Paraguay)(culoare ?pa &~ ?bo &~ ?ar &~ ?br))
    (mapa (tara Uruguay)(culoare ?ur &~ ?ar &~ ?br))

    =>
    
    (printout t "Brazil=" ?br "; ")
    (printout t "French Guiana=" ?fg "; ")
    (printout t "Suriname=" ?su "; ")
    (printout t "Guyana=" ?gu "; ")
    (printout t "Venezuela=" ?ve "; ")
    (printout t "Colombia=" ?co "; ")
    (printout t "Ecuador=" ?ec "; ")
    (printout t "Peru=" ?pe "; ")
    (printout t "Bolivia=" ?bo "; ")
    (printout t "Chile=" ?ch "; ")
    (printout t "Argentina=" ?ar "; ")
    (printout t "Paraguay=" ?pa "; ")
    (printout t "Uruguay=" ?ur "; ")
    (printout t "GATA!" crlf)
)

(run)


; gata
