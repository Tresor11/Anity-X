FactoryBot.define do
  factory :user do
    name { "test name" }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { "password" }
  end

  factory :article do
    title { "MyString" }
    content { "Test content" }
    user
  end
end
