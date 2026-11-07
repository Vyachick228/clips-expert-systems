(defrule find-person
    (person (name $?name) (age ?age))
    (test (and (eq (implode$ $?name) "Anna Ivanova") (= ?age 22)))
    =>
    (printout t "Found: " (implode$ $?name) ", age: " ?age crlf)
)
