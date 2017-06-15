# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(user_name: "Zuhair")
user2 = User.create!(user_name: "Li Hsuan")
user3 = User.create!(user_name: "Terrence")
user4 = User.create!(user_name: "Howard")
user5 = User.create!(user_name: "User5")

poll1 = Poll.create!(title: "App Academy Survey", user_id: user1.id)
poll2 = Poll.create!(title: "SFPD Survey", user_id: user3.id)
poll3 = Poll.create!(title: "Sports Survey", user_id: user2.id)

question1 = Question.create!(text: "Who is your favorite TA?", poll_id: poll1.id)
question2 = Question.create!(text: "Do you enjoy a/A?", poll_id: poll1.id)
question3 = Question.create!(text: "What do you think of our service?", poll_id: poll2.id)
question4 = Question.create!(text: "Who is the current Commissioner?", poll_id: poll2.id)
question5 = Question.create!(text: "What is your favorite sport?", poll_id: poll3.id)
question6 = Question.create!(text: "Did you watch the recent NBA Finals?", poll_id: poll3.id)
question7 = Question.create!(text: "Do you like Steph Curry?", poll_id: poll3.id)

answer1 = AnswerChoice.create!(text: "Aaron", question_id: question1.id)
answer2 = AnswerChoice.create!(text: "Jules", question_id: question1.id)
answer3 = AnswerChoice.create!(text: "Debra", question_id: question1.id)
answer4 = AnswerChoice.create!(text: "Yes :D", question_id: question2.id)
answer5 = AnswerChoice.create!(text: "No :(", question_id: question2.id)
answer6 = AnswerChoice.create!(text: "Amazing.", question_id: question3.id)
answer7 = AnswerChoice.create!(text: "Can be improved.", question_id: question3.id)
answer8 = AnswerChoice.create!(text: "Terrible!", question_id: question3.id)
answer9 = AnswerChoice.create!(text: "L. Julius M. Turman", question_id: question4.id)
answer10 = AnswerChoice.create!(text: "Donald Trump", question_id: question4.id)

response1 = Response.create!(question_id: question1.id, answer_choice_id: answer1.id, user_id: user3.id)
response2 = Response.create!(question_id: question2.id, answer_choice_id: answer4.id, user_id: user2.id)
response3 = Response.create!(question_id: question3.id, answer_choice_id: answer6.id, user_id: user5.id)
response4 = Response.create!(question_id: question4.id, answer_choice_id: answer10.id, user_id: user2.id)
