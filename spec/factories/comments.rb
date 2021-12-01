FactoryBot.define do
  factory :comment do
    user
    post
    content { 'Text for content' }
  end
end
