require 'rails_helper'

RSpec.describe User, type: :model do
  it "expect user firstname" do
    user = User.create(firstname: 'John')

    expect(user.firstname).to eq 'John'
  end

  it "expect user lastname" do
    user = User.create(lastname: 'Travolta')

    expect(user.lastname).to eq 'Travolta'
  end

  it "expect user email" do
    user = User.create(email: 'actor@gmail.com')

    expect(user.email).to eq 'actor@gmail.com'
  end

  # it "expect user date_of_birth" do
  #   user = User.create(date_of_birth: '05.03.1990')
  #
  #   expect(user.date_of_birth).to eq '05.03.1990'
  # end
end
