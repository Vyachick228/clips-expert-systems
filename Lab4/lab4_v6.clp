(deftemplate shrub
    (slot name)
    (multislot traits)
)

(deftemplate wanted
    (slot trait)
)

(deffacts shrubs
    (shrub (name TreeHydrangea)
        (traits urban container fast-growth))
    (shrub (name Oleander)
        (traits container))
    (shrub (name WaxMyrtle)
        (traits cold shade drought wet-soil))
    (shrub (name Honeysuckle)
        (traits urban easy-care fast-growth))
    (shrub (name Gardenia)
        (traits drought urban container easy-care fast-growth))
    (shrub (name CommonJuniper)
        (traits cold drought acidic-soil urban))
    (shrub (name AlderleafFlower)
        (traits cold shade wet-soil acidic-soil))
    (shrub (name TatarDogwood)
        (traits cold shade wet-soil easy-care fast-growth))
    (shrub (name JapaneseAucuba)
        (traits shade container))
    (shrub (name CanadianRhododendron)
        (traits cold drought))
)

; Required traits: cold tolerance, shade tolerance and wet soil.
(deffacts required-traits
    (wanted (trait cold))
    (wanted (trait shade))
    (wanted (trait wet-soil))
)

; Check whether one required characteristic is present.
(deffunction check-trait (?required ?traits)
    (return (neq (member$ ?required ?traits) FALSE))
)

; Print one matching shrub.
(deffunction print-recommendation (?name)
    (printout t "Recommended shrub: " ?name crlf)
)

; A shrub is selected only if every wanted trait is present.
(defrule recommend-shrub
    (shrub (name ?name) (traits $?traits))
    (exists (wanted (trait ?)))
    (not (wanted (trait ?required&:(not (check-trait ?required ?traits)))))
    =>
    (print-recommendation ?name)
)
