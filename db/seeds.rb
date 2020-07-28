# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: "Johnny", password: "pass")
user.owned_project_cars.create(year: 1989, make: "Toyota", model: "Cressida", engine: "1JZGTE", drivetrain: "Auto", suspension: "Stock", wheels_and_tires: "Enkei RPF1")
user.owned_project_cars.create(year: 1984, make: "Toyota", model: "Corolla", engine: "4AC", drivetrain: "Auto", suspension: "Stock", wheels_and_tires: "Stock")

user = User.create(username: "Bill", password: "pass")
user.owned_project_cars.create(year: 2001, make: "Acura", model: "Integra", engine: "B18C", drivetrain: "5 Speed", suspension: "Ground Controls", wheels_and_tires: "Blades")

user = User.create(username: "Mickey", password: "pass")
user.owned_project_cars.create(year: 1988, make: "BMW", model: "E30", engine: "M20", drivetrain: "5 Speed, Z4 Shifter", suspension: "Stock", wheels_and_tires: "Replicas")