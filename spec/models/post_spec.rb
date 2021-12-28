require 'rails_helper'

RSpec.describe Post, type: :model do

  let!(:post) { build(:post) }

  context 'Validations' do
    it { should validate_length_of(:title).is_at_least(3) }

    it { should validate_length_of(:body).is_at_least(2) }

    it 'expect post to be valid' do
      expect(post).to be_valid
    end

    it 'is not valid without title' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'is not valid without body' do
      post.body = nil
      expect(post).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
