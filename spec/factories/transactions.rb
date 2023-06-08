FactoryBot.define do
  factory :transaction do
    name { 'MyString' }
    amount { '9.99' }
    category { nil }
  end
end
