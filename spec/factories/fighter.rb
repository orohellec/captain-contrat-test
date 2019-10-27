FactoryBot.define do
  factory :fighter do
    name { FFaker::Name.name[2..12] }
    health { 200 }
    attack { 15 }
    user
    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new('spec/support/assets/test-image.jpg', 'image/jpg') }
    end
  end
end