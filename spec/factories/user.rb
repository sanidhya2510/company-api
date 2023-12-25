FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' } # Adjust the password as needed
    end
  end
  