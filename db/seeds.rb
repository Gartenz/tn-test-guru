# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Bob', role: 'User' }, { name: 'Maggie', role: 'User' }])

categories = Category.create!([{ title: 'backend' }, { title: 'frontend' }, { title: 'administration' }])

Test.create!(title: 'Ruby', level: 1, category_id: categories[0].id, user_id: users[0].id)
Test.create!(title: 'Rails', level: 2, category_id: categories[1].id, user_id: users[0].id)
Test.create!(title: 'CSS', level: 1, category_id: categories[1].id, user_id: users[1].id)
Test.create!(title: 'HTML', level: 1, category_id: categories[1].id, user_id: users[1].id)
Test.create!(title: 'C#', level: 1, category_id: categories[0].id, user_id: users[0].id)
Test.create!(title: 'C++', level: 1, category_id: categories[0].id, user_id: users[0].id)

tests = Test.all

Question.create!(body: 'question1', test_id: tests[0].id)
Question.create!(body: 'question1', test_id: tests[2].id)

questions = Question.all

Answer.create!(body: "False answer", question_id: questions[0].id)
Answer.create!(body: "True answer", correct: true, question_id: questions[0].id)
Answer.create!(body: "False answer", question_id: questions[0].id)
Answer.create!(body: "False answer", question_id: questions[0].id)

Answer.create!(body: "False answer", question_id: questions[1].id)
Answer.create!(body: "False answer", question_id: questions[1].id)
Answer.create!(body: "False answer", question_id: questions[1].id)
Answer.create!(body: "True answer", correct: true, question_id: questions[1].id)

TestsUser.create!(user_id: users[0].id, test_id: tests[0].id)
TestsUser.create!(user_id: users[0].id, test_id: tests[2].id)
TestsUser.create!(user_id: users[1].id, test_id: tests[2].id)
