FactoryBot.define do

  factory :user do
    name { "test name" }
  end

  factory :article do
    title { "MyString" }
    user
  end
end
