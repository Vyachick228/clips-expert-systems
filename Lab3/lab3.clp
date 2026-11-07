(deftemplate parent
    (slot name)
    (slot child)
    (slot relation)
)

(deftemplate family
    (slot child)
    (slot father)
    (slot mother)
)

(deftemplate person
    (slot name)
    (slot role)
    (slot gender)
)

(deffacts family-facts
    (parent (name Tom) (child John) (relation father))
    (parent (name Susan) (child John) (relation mother))
    (family (child John) (father Tom) (mother Susan))
    (person (name Tom) (role father) (gender male))
    (person (name Susan) (role mother) (gender female))
    (person (name John) (role son) (gender male))
)

(defrule family-01-father
    (declare (salience 90))
    (parent (name ?father) (child ?child) (relation father))
    =>
    (printout t "The father of " ?child " is " ?father "." crlf)
)

(defrule family-02-mother
    (declare (salience 80))
    (parent (name ?mother) (child ?child) (relation mother))
    =>
    (printout t "The mother of " ?child " is " ?mother "." crlf)
)

(defrule family-03-parents
    (declare (salience 70))
    (family (child ?child) (father ?father) (mother ?mother))
    =>
    (printout t "The parents of " ?child " are " ?father
                " and " ?mother "." crlf)
)

(defrule family-04-father-role
    (declare (salience 60))
    (person (name ?name) (role father))
    =>
    (printout t ?name " is a father." crlf)
)

(defrule family-05-mother-role
    (declare (salience 50))
    (person (name ?name) (role mother))
    =>
    (printout t ?name " is a mother." crlf)
)

(defrule family-06-son-role
    (declare (salience 40))
    (person (name ?name) (role son))
    =>
    (printout t ?name " is a son." crlf)
)

(defrule family-07-father-gender
    (declare (salience 30))
    (person (name ?name) (role father) (gender male))
    =>
    (printout t ?name " is a male." crlf)
)

(defrule family-08-mother-gender
    (declare (salience 20))
    (person (name ?name) (role mother) (gender female))
    =>
    (printout t ?name " is a female." crlf)
)

(defrule family-09-son-gender
    (declare (salience 10))
    (person (name ?name) (role son) (gender male))
    =>
    (printout t ?name " is a male." crlf)
)
