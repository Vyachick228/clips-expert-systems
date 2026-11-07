(deftemplate person
    (multislot name)
    (slot age (type INTEGER))
    (slot gender (allowed-values male female))
)

(deffacts people
    (person (name Ivan Petrov) (age 20) (gender male))
    (person (name Anna Ivanova) (age 22) (gender female))
    (person (name Petro Sidorov) (age 25) (gender male))
)
