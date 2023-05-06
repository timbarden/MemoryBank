FactoryBot.define do
  factory :user do
    id { :n }
    name { "User name" }
    email { |n| "test#{n}@example.com" }
    password { "password" }
  end
end
