require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user) {build(:user)}

  context "Validations" do

  it 'expect user to be valid' do
    expect(user).to be_valid
  end

  it "is not valid without email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "is not valid without firstname" do
    user.firstname = nil
    expect(user).to_not be_valid
  end

  it "is not valid without lastname"do
    user.lastname = nil
    expect(user).to_not be_valid
  end


  # it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  # describe "Assaociations" do
  #   it {should has_many(:posts)}
  # end
end
