require 'rails_helper'

RSpec.describe Comment, type: :model do

  let!(:comment) { build(:comment) }

  context 'Validations' do

    it 'expect comment to be valid' do
      expect(comment).to be_valid
    end


    it 'is not valid without content' do
      content = nil
      expect(comment).to be_valid
    end
  end

  describe "Associasions" do
    it {should belong_to(:post)}
    it { should belong_to(:user) }
  end
end
