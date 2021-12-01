FactoryBot.define do

  factory :user do
    sequence(:email) { |e| 'test#{e}@gmail.com'}
    firstname { 'John' }
    lastname { 'Jackobs' }
    password { 'prosto4M' }
    admin { false }
  end
end
