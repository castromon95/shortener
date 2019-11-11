FactoryBot.define do
  factory :reducer do
    token { 't' }
    url { Faker::Internet.url }
    count { 0 }
  end
end
