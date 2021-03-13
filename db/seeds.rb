
bob = User.create(name: "Bob")
bob_class = Classroom.create(period: 2, subject: "Math", teacher: "Mr. Bob", user: bob)

jimmy = Student.create(first_name: "Jimmy", last_name: "Johnson", grade: 3, lunch_period: "A")
timmy = Student.create(first_name: "Timmy", last_name: "Tonson", grade: 3, lunch_period: "A")
mimmy = Student.create(first_name: "Mimmy", last_name: "Monson", grade: 3, lunch_period: "B")
bimmy = Student.create(first_name: "Bimmy", last_name: "Bonson", grade: 3, lunch_period: "B")
bob_class.students = jimmy, timmy, mimmy, bimmy


pnuts = Allergy.create(name: "Peanuts", category: "Food Allergy")
weird = Allergy.create(name: "Eye contact", category: "Other")


epi = Severity.create(level: "Needs Epinephrine", student: jimmy, allergy: pnuts)
mild = Severity.create(level: "Needs to be left alone", student: mimmy, allergy: weird)

epi2 = Severity.create(level: "Needs Epinephrine", student: timmy, allergy: pnuts)
mild2 = Severity.create(level: "Needs to be left alone", student: timmy, allergy: weird)