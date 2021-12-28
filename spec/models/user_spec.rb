require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user) { build(:user) }

  context 'Validations' do

    it 'expect user to be valid' do
      expect(user).to be_valid
    end

    it { should validate_length_of(:email).is_at_least(3) }

    it { should validate_length_of(:firstname).is_at_least(3) }

    it { should validate_length_of(:lastname).is_at_least(3) }

    it 'is not valid without email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without firstname' do
      user.firstname = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without lastname'do
      user.lastname = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without password' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:posts) }
    it { should have_and_belong_to_many(:friends) }
    it { should have_one_attached(:avatar) }
    it do
      should have_and_belong_to_many(:friends)
                                              .class_name('User')
                                              .join_table(:connections)
    end
  end
end
