FactoryBot.define do
  factory :post do
    user
    title { 'Test title' }
    body { 'Some text for testing rpec tests' }
    author { 'Michael' }
  end
end
