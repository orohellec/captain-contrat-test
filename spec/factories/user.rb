FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password  { 'lalala' }
  end
end