
bob = User.create(name: "Bob")
bob_class = Classroom.create(period: "A", subject: "Math", teacher: "Mr. Bob", user: bob)

jimmy = Student.create(name: "Jimmy")
bob_class.students << jimmy
timmy = Student.create(name: "Timmy")
bob_class.students << timmy
mimmy = Student.create(name: "Mimmy")
bob_class.students << mimmy
bimmy = Student.create(name: "Bimmy")
bob_class.students << bimmy



pnuts = Allergy.create(name: "Peanuts")
weird = Allergy.create(name: "Eye contact")


epi = Severity.create(name: "Needs Epinephrine", student: jimmy, allergy: pnuts)
mild = Severity.create(name: "Needs to be left alone", student: mimmy, allergy: weird)

epi2 = Severity.create(name: "Needs Epinephrine", student: timmy, allergy: pnuts)
mild2 = Severity.create(name: "Needs to be left alone", student: timmy, allergy: weird)