
# Users
admin = User.create(username: "bob", password: "builder")

# Classrooms
math = Classroom.create(period: 1, subject: "Math", teacher: "Mrs. Smith", user: admin)
bio = Classroom.create(period: 2, subject: "Biology", teacher: "Mr. Stevens", user: admin)
ping = Classroom.create(period: 3, subject: "Ping Pong", teacher: "Ms. Thompson", user: admin)
spanish = Classroom.create(period: 4, subject: "Spanish", teacher: "Sra. Hernandez" , user: admin)
lit = Classroom.create(period: 5, subject: "Literature", teacher: "Mr. Capute", user: admin)

# Students
jimmy = Student.create(first_name: "Jimmy", last_name: "Johnson", grade: 3, lunch_period: "A")
timmy = Student.create(first_name: "Timmy", last_name: "Tonson", grade: 3, lunch_period: "A")
mimmy = Student.create(first_name: "Mimmy", last_name: "Monson", grade: 3, lunch_period: "B")
bimmy = Student.create(first_name: "Bimmy", last_name: "Bonson", grade: 3, lunch_period: "B")

sponge = Student.create(first_name: "Spongebob", last_name: "Squarepants", grade: 3, lunch_period: "A")
patrick = Student.create(first_name: "Patrick", last_name: "Star", grade: 3, lunch_period: "A")
sandy = Student.create(first_name: "Sandy", last_name: "Cheeks", grade: 3, lunch_period: "B")
krabs = Student.create(first_name: "Eugene", last_name: "Krabs", grade: 3, lunch_period: "B")

scooby = Student.create(first_name: "Scubby", last_name: "Doo", grade: 4, lunch_period: "C")
shaggy = Student.create(first_name: "Shaggy", last_name: "Rogers", grade: 4, lunch_period: "C")
fred = Student.create(first_name: "Fred", last_name: "Jones", grade: 4, lunch_period: "D")
daphne = Student.create(first_name: "Daphne", last_name: "Blake", grade: 4, lunch_period: "D")
velma = Student.create(first_name: "Velma", last_name: "Dinkley", grade: 4, lunch_period: "D")
scrappy = Student.create(first_name: "Scrappy", last_name: "Doo", grade: 4, lunch_period: "C")

bugs = Student.create(first_name: "Bugs", last_name: "Bunny", grade: 4, lunch_period: "A")
daffy = Student.create(first_name: "Daffy", last_name: "Duck", grade: 4, lunch_period: "B")
taz = Student.create(first_name: "Tasmanian", last_name: "Devil", grade: 4, lunch_period: "C")
elmer = Student.create(first_name: "Elmer", last_name: "Fudd", grade: 4, lunch_period: "A")
pork = Student.create(first_name: "Porky", last_name: "Pig", grade: 4, lunch_period: "B")
tweety = Student.create(first_name: "Tweety", last_name: "Bird", grade: 4, lunch_period: "C")

# Enrollments
math.students = jimmy, timmy, mimmy, bimmy, sponge, patrick, sandy, krabs
bio.students = jimmy, scooby, shaggy, fred, daphne, velma, scrappy, bugs
ping.students = jimmy, daffy, taz, elmer, pork, tweety, mimmy, sponge
spanish.students = jimmy, sandy, scooby, fred, velma, bugs, taz, pork
lit.students = jimmy, timmy, bimmy, patrick, krabs, shaggy, daphne, scrappy

# Allergies
pnuts = Allergy.create(name: "Peanuts", category: "Food Allergy")
latex = Allergy.create(name: "Latex", category: "Other Allergy")
bees = Allergy.create(name: "Bees", category: "Other Allergy")
eggs = Allergy.create(name: "Eggs", category: "Food Allergy")
grass = Allergy.create(name: "Grass", category: "Other Allergy")
Allergy.create(name: "Eye contact", category: "Other Allergy")

# Severities
jimmy_pnut = Severity.create(level: "Epi Pen", student: jimmy, allergy: pnuts)
jimmy_grass = Severity.create(level: "OTC Medication (ex. Benedryl)", student: jimmy, allergy: grass)
patrick_eggs = Severity.create(level: "Prescription Medication", student: patrick, allergy: eggs)
fred_bees = Severity.create(level: "Epi Pen", student: fred, allergy: bees)
taz_latex = Severity.create(level: "OTC Medication (ex. Benedryl)", student: taz, allergy: latex)
tweety_pnut = Severity.create(level: "Epi Pen", student: tweety, allergy: pnuts)

