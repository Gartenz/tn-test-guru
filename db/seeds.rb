# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{ name: 'Bob', role: 'User' }, { name: 'Maggie', role: 'User' }])

Category.create!([{ title: 'backend' }, { title: 'frontend' }, { title: 'administration' }])

Test.create!(title: 'Ruby', level: 1, category_id: Category.find_by(title: 'backend').id)
Test.create!(title: 'Rails', level: 2, category_id: Category.find_by(title: 'frontend').id)
Test.create!(title: 'CSS', level: 1, category_id: Category.find_by(title: 'frontend').id)
Test.create!(title: 'HTML', level: 1, category_id: Category.find_by(title: 'frontend').id)
Test.create!(title: 'C#', level: 1, category_id: Category.find_by(title: 'backend').id)
Test.create!(title: 'C++', level: 1, category_id: Category.find_by(title: 'backend').id)

Question.create!(body: 'question1', test_id: Test.find_by(title: 'Ruby').id)
Question.create!(body: 'question1', test_id: Test.find_by(title: 'CSS').id)

Answer.create!(body: "False answer", question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'Ruby').id).id)
Answer.create!(body: "True answer", correct: true, question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'Ruby').id).id)
Answer.create!(body: "False answer", question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'Ruby').id).id)
Answer.create!(body: "False answer", question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'Ruby').id).id)

Answer.create!(body: "False answer", question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'CSS').id).id)
Answer.create!(body: "False answer", question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'CSS').id).id)
Answer.create!(body: "False answer", question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'CSS').id).id)
Answer.create!(body: "True answer", correct: true, question_id: Question.find_by(body: 'question1', test_id: Test.find_by(title: 'CSS').id).id)

TestHistory.create!(user_id: User.find_by(name: 'Bob').id, test_id: Test.find_by(title: 'Ruby').id)
TestHistory.create!(user_id: User.find_by(name: 'Bob').id, test_id: Test.find_by(title: 'CSS').id)
TestHistory.create!(user_id: User.find_by(name: 'Maggie').id, test_id: Test.find_by(title: 'CSS').id)
