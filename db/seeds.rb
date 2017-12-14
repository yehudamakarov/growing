# User(id: integer, username: string, email: string, password_digest: string, created_at: datetime, updated_at: datetime)

# Task(id: integer, name: string, effect: string, user_id: integer, created_at: datetime, updated_at: datetime, day: string)

user = User.create(username: "testuser", email: "testuser@gmail.com", password: "password")

fake_user = User.create(username: "fakeuser", email: "fakeuser@gmail.com", password: "password")

Task.create(name: "be happy 1", effect: "this is amazing", user: user, day: "sunday")
Task.create(name: "be happy 1.1", effect: "this is amazing", user: user, day: "sunday")
Task.create(name: "be happy 1.2", effect: "this is amazing", user: user, day: "sunday")
Task.create(name: "be happy 2", effect: "this is amazing", user: user, day: "monday")
Task.create(name: "be happy 3", effect: "this is amazing", user: user, day: "tuesday")
Task.create(name: "be happy 4", effect: "this is amazing", user: user, day: "wednesday")
Task.create(name: "be happy 5", effect: "this is amazing", user: user, day: "thursday")
Task.create(name: "be happy 6", effect: "this is amazing", user: user, day: "friday")

Task.create(name: "be amazing 1", effect: "this is amazing", user: fake_user, day: "sunday")
Task.create(name: "be amazing 1.1", effect: "this is amazing", user: fake_user, day: "sunday")
Task.create(name: "be amazing 1.2", effect: "this is amazing", user: fake_user, day: "sunday")
Task.create(name: "be amazing 2", effect: "this is amazing", user: fake_user, day: "monday")
Task.create(name: "be amazing 3", effect: "this is amazing", user: fake_user, day: "tuesday")
Task.create(name: "be amazing 4", effect: "this is amazing", user: fake_user, day: "wednesday")
Task.create(name: "be amazing 5", effect: "this is amazing", user: fake_user, day: "thursday")
Task.create(name: "be amazing 6", effect: "this is amazing", user: fake_user, day: "friday")
