FactoryBot.define do
  factory :entry do
    question { "Is this a test question?" }
    answer { "Yes, this is a test answer." }
    user_id { :n }
  end
end
