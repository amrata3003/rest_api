FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    credit { 5 }
  end

  factory :tutor do
    course
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
