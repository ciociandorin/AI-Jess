(deftemplate PrognozaMeteo (slot nori)(slot directieVant)(slot orePreviziune)(slot detalii))

(assert (PrognozaMeteo(nori nil)(directieVant nil)(orePreviziune nil)(detalii cer-foarte-rosu)))
(assert (PrognozaMeteo(nori nil)(directieVant nil)(orePreviziune nil)(detalii senin)))
(assert (PrognozaMeteo(nori nil)(directieVant nil)(orePreviziune nil)(detalii ceata-dimineata-sau-seara)))
(assert (PrognozaMeteo(nori cumulus)(directieVant NE-S)(orePreviziune nil)(detalii nil)))
(assert (PrognozaMeteo(nori cirrocumulus)(directieVant NE-S)(orePreviziune nil)(detalii nil)))
(assert (PrognozaMeteo(nori stratocumulus)(directieVant NE-S)(orePreviziune nil)(detalii nil)))
(assert (PrognozaMeteo(nori nimbostratus)(directieVant SW-N)(orePreviziune nil)(detalii nil)))
(assert (PrognozaMeteo(nori nimbostratus)(directieVant NE-S)(orePreviziune nil)(detalii nil)))
(assert (PrognozaMeteo(nori cumulonimbus)(directieVant NE-S)(orePreviziune nil)(detalii inainte-de-miezul-noptii)))
(assert (PrognozaMeteo(nori cirrostratus)(directieVant NE-S)(orePreviziune 15or24)(detalii nil)))
(assert (PrognozaMeteo(nori altostratus)(directieVant NE-S)(orePreviziune 24)(detalii innorat)))
(assert (PrognozaMeteo(nori altocumulus)(directieVant NE-S)(orePreviziune 15-20)(detalii nil)))

(facts)


(defrule cerSenin
    (PrognozaMeteo(detalii ?v){
    	detalii == cer-foarte-rosu  
    })
    =>
    (printout t "Daca avem " ?v ", a doua zi cerul va fi senin." crlf)
)

(defrule ger
    (PrognozaMeteo(detalii ?v){
    	detalii == senin    
    })
    =>
    (printout t "Daca cerul este " ?v ", va fi ger." crlf)
)
	
(defrule cald
    (PrognozaMeteo(detalii ?v){
    	detalii == ceata-dimineata-sau-seara    
    })
    =>
    (printout t "Daca va fi " ?v ", va fi cald." crlf)
    
    )

(defrule vremeBuna
    (PrognozaMeteo(nori ?n)(directieVant ?dv){
    	nori == cumulus && directieVant != NE-S
    })
    =>
    (printout t "Deoarece pe cer exista norii " ?n " iar vantul din directia " ?dv " nu bate, ne indica vreme buna." crlf)
    
    )

(defrule NimbostratusiiPeCer
    (PrognozaMeteo(nori ?n)(directieVant ?dv){
    	nori == cumulus && directieVant == NE-S
    })
    =>
    (printout t ?n "ii se pot transforma in nimbostratusi deoarece vantul bate in directia " ?dv crlf)
    
    )

(defrule ploaie
    (PrognozaMeteo(nori ?n)(directieVant ?dv){
    	nori == cirrocumulus && directieVant == NE-S
    })
    =>
    (printout t "Avem norii " ?n ", care deoarece bate vantul in directia " ?dv " ne indica ploaie!" crlf)
    
    )

(defrule CumulonimbusiPeCer
    (PrognozaMeteo(nori ?n)(directieVant ?dv){
    	nori == stratocumulus && directieVant == NE-S
    })
    =>
    (printout t ?n "ii se pot transforma in cumulonimbusi deoarece vantul bate in directia " ?dv crlf)
    
    )


(defrule ploaieScurta
    (PrognozaMeteo(nori ?n)(directieVant ?dv){
    	nori == nimbostratus && directieVant == SW-N
    })
    =>
    (printout t ?n " se gasesc pe cer si deoarece vantul bate in directia " ?dv " avem o ploaie scurta" crlf)
    
    )

(defrule ploaieLunga
    (PrognozaMeteo(nori ?n)(directieVant ?dv){
    	nori == nimbostratus && directieVant == NE-S
    })
    =>
    (printout t ?n " se gasesc pe cer si deoarece vantul bate in directia " ?dv " avem o ploaie lunga" crlf)
    
    )

(defrule zapada
    (PrognozaMeteo(nori ?n)(detalii ?v){
    	nori == cumulonimbus && detalii == inainte-de-miezul-noptii
    })
    =>
    (printout t "Daca norii " ?n " apar pe cer " ?v ", atunci vom avea zapada." crlf)
    
    )

(defrule ploaie15-24inainte
    (PrognozaMeteo(nori ?n)(orePreviziune ?op)(directieVant ?dv){
    	nori == cirrostratus && directieVant == NE-S
    })
    =>
    (printout t "Daca norii " ?n " apar pe cer si daca vantul bate in directia " ?dv ", atunci se va detecta ploaia cu " ?op " ore inainte." crlf)
    
    )

(defrule ploaieOZiInainte
    (PrognozaMeteo(nori ?n)(directieVant ?dv)(orePreviziune ?op)(detalii ?v){
    	nori == altostratus && directieVant == NE-S && detalii == innorat
    })
    =>
    (printout t "Daca norii " ?n " apar pe cer si daca vantul bate in directia " ?dv " si daca este " ?v ", atunci se va detecta ploaia cu " ?op " ore inainte." crlf)
    
)

(defrule ploaieCu15-20_OreInainte
    (PrognozaMeteo(nori ?n)(directieVant ?dv)(orePreviziune ?op){
    	nori == altocumulus && directieVant == NE-S
    })
    =>
    (printout t "Daca norii " ?n " apar pe cer si daca vantul bate in directia " ?dv ", atunci se va detecta ploaia cu " ?op " ore inainte." crlf)
    
)

(run)
