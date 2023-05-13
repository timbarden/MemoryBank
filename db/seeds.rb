# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(name: "Test User", email: ENV["TEST_EMAIL_ADDRESS"], password: ENV["TEST_PASSWORD"])

x = 0
while x < 10
    Entry.create(question: "This is example question number #{x+1}", answer: "This is the answer for example question #{x+1}", user_id: 1)
    x += 1
end

Tag.create(name: "CMS")
Tag.create(name: "Rails")
Tag.create(name: "Databases")

Tagging.create(tag_id: 1, entry_id: 1)