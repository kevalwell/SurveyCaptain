require 'faker'
kev = User.create(email: "kev", password: "123")
max = User.create(email: "max", password: "123")

kev_surveys = []
max_surveys = []

3.times do
  kev_surveys << Survey.create(
  user_id: kev.id ,
  title: Faker::Company.catch_phrase,
  topic: Faker::Lorem.sentence
  )

end

3.times do
  max_surveys << Survey.create(
    user_id: max.id,
    title: Faker::Company.catch_phrase,
    topic: Faker::Lorem.sentence
        )
end

question_collection2 = []
question_collection1 = []

kev_surveys.each do |survey|
  5.times do
   question_collection2 << Question.create(
      description: Faker::Lorem.sentence,
      survey_id: survey.id
    )
  end
end

max_surveys.each do |survey|
  5.times do
   question_collection1 << Question.create(
      description: Faker::Lorem.sentence,
      survey_id: survey.id
    )
  end
end

  question_collection1.each do |question|
    4.times do
      question.choices.create(
    option: Faker::Lorem.sentence)
  end
end

  question_collection2.each do |question|
    4.times do
      question.choices.create(
    option: Faker::Lorem.sentence)
  end
end
