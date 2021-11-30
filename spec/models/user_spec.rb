require 'rails_helper'

RSpec.describe User, type: :model do
  it "expect user firstname and lastname and admin status" do
    user = build(:user)

    expect(user.firstname).to eq 'Artur'
    expect(user.lastname).to eq 'King'
    expect(user.admin).to eq false
  end
end
