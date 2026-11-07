(deftemplate person
    (slot name)
    (slot age)
    (slot gender)
)

(deffacts people
    (person (name Ivan) (age 20) (gender male))
    (person (name Anna) (age 22) (gender female))
    (person (name Petro) (age 25) (gender male))
)
