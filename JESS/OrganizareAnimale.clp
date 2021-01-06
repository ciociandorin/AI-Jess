(deftemplate Animal 
    (slot nume)(multislot nutrimente)(slot modviata)
    (slot mediuviata)(slot reproducere)(slot zona)
)

(deffacts GradinaZoo
    (Animal(nume pinguin)(nutrimente morcovi peste)
        (modviata diurn)(mediuviata semiacvatic)
        (reproducere "prin oua")(zona polara))
	(Animal(nume broasca)(nutrimente iarba morcovi insecte)
        (modviata nocturn)(mediuviata semiacvatic)
        (reproducere "prin oua")(zona semicontinentala))
    (Animal(nume "porc salbatic")(nutrimente porumb iarba)
        (modviata diurn)(mediuviata terestru)
        (reproducere "pui vii")(zona semicontinentala))
    (Animal(nume pui)(nutrimente porumb concentrat malai)
        (modviata diurn)(mediuviata terestru)
        (reproducere "prin oua"))
    (Animal(nume haringa)(nutrimente cereale porumb)
        (modviata diurn)(mediuviata acvatic)
        (reproducere "prin oua")(zona mediteraneana))
    (Animal(nume crocodil)(nutrimente carne porumb)
        (modviata diurn)(mediuviata semiacvatic)
        (reproducere "prin oua")(zona mediteraneana))
    (Animal(nume lup)(nutrimente carne)
        (modviata diurn)(mediuviata terestru)
        (reproducere "pui vii")(zona continentala))
    (Animal(nume urs)(nutrimente carne peste)
        (modviata diurn)(mediuviata terestru)
        (reproducere "pui vii")(zona polara))
    (Animal(nume foca)(nutrimente cereale)
        (modviata diurn)(mediuviata semiacvatic)
        (reproducere "prin oua")(zona polara))
)

; (a)
(defrule mediu-viata-semiacvatic
    (declare (salience 110))
	(Animal(nume ?n)(mediuviata semiacvatic))
    =>
    (printout t "Animalele semiacvatice sunt: " ?n crlf)
)


; (b)
(defrule regim-alimentar-vegetarian-zona-mediteraneana
    (declare (salience 100))
    ?w1<-(Animal(nume ?n)(nutrimente ?nutri &~ carne $?)(zona mediteraneana))
	=>
    (printout t "Animale vegetariane si din zona mediteraneana: " ?n crlf)
    (retract ?w1)
)

(reset)
(run)

; (c)
(deftemplate PerechiAnimaleConsum (slot animalConsumator)(slot animalConsumat))
(assert (PerechiAnimaleConsum(animalConsumator lup)(animalConsumat pui)))
(assert (PerechiAnimaleConsum(animalConsumator lup)(animalConsumat "porc salbatic")))
(assert (PerechiAnimaleConsum(animalConsumator crocodil)(animalConsumat haringa)))
(assert (PerechiAnimaleConsum(animalConsumator crocodil)(animalConsumat broasca)))
            
    
(defrule pereche-de-prada-si-pradator
    (declare (salience 90))
	(PerechiAnimaleConsum(animalConsumator ?acr)(animalConsumat ?aco))
    =>
	(printout t "Animalul consumator este " ?acr ", iar animalul consumat este " ?aco crlf)
)
(run)

; (d)
(defrule zona-polara-urs-foca
    (declare (salience 50))
	(Animal(nume ?n)(zona polara){
    	nume == urs || nume == foca    
    })
    =>    
    (printout t "Animalele din zona polara utilizand metoda de antipattern sunt: " ?n crlf)
)
(run)

