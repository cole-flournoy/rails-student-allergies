
bob = User.create(name: "Mr. Bob")
bob_class = Classroom.create(name: "Mr. Bob's Class", user: bob)

jimmy = Student.create(name: "Jimmy", classroom: bob_class)
timmy = Student.create(name: "Timmy", classroom: bob_class)
mimmy = Student.create(name: "Mimmy", classroom: bob_class)
bimmy = Student.create(name: "Bimmy", classroom: bob_class)

pnuts = Allergy.create(name: "Peanuts")
weird = Allergy.create(name: "Eye contact")


epi = Severity.create(name: "Needs Epinephrine", student: jimmy, allergy: pnuts)
mild = Severity.create(name: "Needs to be left alone", student: mimmy, allergy: weird)

epi2 = Severity.create(name: "Needs Epinephrine", student: timmy, allergy: pnuts)
mild2 = Severity.create(name: "Needs to be left alone", student: timmy, allergy: weird)