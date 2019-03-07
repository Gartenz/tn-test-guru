# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Bob', role: 'User', email: 'bob@tests.ru' },
                      { name: 'Maggie', role: 'User', email: 'maggie@tests.ru' }])

categories = Category.create!([{ title: 'backend' }, { title: 'frontend' }, { title: 'administration' }])

users[0].created_tests.create!(title: 'Ruby', level: 1, category_id: categories[0].id)
users[0].created_tests.create!(title: 'Rails', level: 2, category_id: categories[1].id)
users[0].created_tests.create!(title: 'C#', level: 1, category_id: categories[0].id)
users[0].created_tests.create!(title: 'C++', level: 1, category_id: categories[0].id)
users[1].created_tests.create!(title: 'CSS', level: 1, category_id: categories[1].id)
users[1].created_tests.create!(title: 'HTML', level: 1, category_id: categories[1].id)
tests = Test.all

tests.each do |test|
  question = test.questions.create!(body: 'question1')
  question.answers.create!(body: "False answer")
  question.answers.create!(body: "True answer", correct: true)
  question.answers.create!(body: "False answer")
  question.answers.create!(body: "False answer")
  question.save!
end

TestsUser.create!(user_id: users[0].id, test_id: tests[0].id)
TestsUser.create!(user_id: users[0].id, test_id: tests[2].id)
TestsUser.create!(user_id: users[1].id, test_id: tests[2].id)
