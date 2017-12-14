

user = User.create(username: "testuser", email: "testuser@gmail.com", password: "password")

fake_user = User.create(username: "fakeuser", email: "fakeuser@gmail.com", password: "password")

sunday = Day.create(name: "Sunday")
monday = Day.create(name: "Monday")
tuesday = Day.create(name: "Tuesday")
wednesday = Day.create(name: "Wednesday")
thursday = Day.create(name: "Thursday")
friday = Day.create(name: "Friday")
saturday = Day.create(name: "Saturday")

task = Task.create(name: "eat a good breakfast", effect: "I'll be energetic!", user: user)

task.day_tasks.create(day: sunday)
task.day_tasks.create(day: monday)


Task.create(name: "be happy 1", effect: "this is amazing", user: user).day_tasks.create(day: sunday)
Task.create(name: "be happy 1.1", effect: "this is amazing", user: user).day_tasks.create(day: monday)
Task.create(name: "be happy 1.2", effect: "this is amazing", user: user).day_tasks.create(day: tuesday)
Task.create(name: "be happy 2", effect: "this is amazing", user: user).day_tasks.create(day: wednesday)
Task.create(name: "be happy 3", effect: "this is amazing", user: user).day_tasks.create(day: thursday)
Task.create(name: "be happy 4", effect: "this is amazing", user: user).day_tasks.create(day: friday)
Task.create(name: "be happy 5", effect: "this is amazing", user: user).day_tasks.create(day: saturday)
Task.create(name: "be happy 6", effect: "this is amazing", user: user).day_tasks.create(day: sunday)

Task.create(name: "be amazing 1", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
Task.create(name: "be amazing 1.1", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
Task.create(name: "be amazing 1.2", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
Task.create(name: "be amazing 2", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
Task.create(name: "be amazing 3", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
Task.create(name: "be amazing 4", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
Task.create(name: "be amazing 5", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
Task.create(name: "be amazing 6", effect: "this is amazing", user: fake_user).day_tasks.create(day: sunday)
