# User(id: integer, username: string, email: string, password_digest: string, created_at: datetime, updated_at: datetime)

# Task(id: integer, name: string, effect: string, user_id: integer, created_at: datetime, updated_at: datetime, day: string)

user = User.create(username: "testuser", email: "testuser@gmail.com", password: "password")

Task.create(name: "be happy 1", effect: "this is amazing", user: user, day: "Sunday")
Task.create(name: "be happy 2", effect: "this is amazing", user: user, day: "Monday")
Task.create(name: "be happy 3", effect: "this is amazing", user: user, day: "Tuesday")
Task.create(name: "be happy 4", effect: "this is amazing", user: user, day: "Wednesday")
Task.create(name: "be happy 5", effect: "this is amazing", user: user, day: "Thursday")
Task.create(name: "be happy 6", effect: "this is amazing", user: user, day: "Friday")
