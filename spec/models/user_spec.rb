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
  end
  describe "Associations" do
    it { should have_many(:posts)}
    it { should have_many(:comments)}
    it { should have_many(:posts)}
  end
end
