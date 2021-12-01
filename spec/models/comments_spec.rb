require 'rails_helper'

RSpec.describe Comment, type: :model do

  let!(:comment) { build(:comment) }

  context 'Validations' do

    it 'expect comment to be valid' do
      expect(comment).to be_valid
    end


    # it 'is not valid without content' do
    #   comment.content = nil
    #   expect(comment).to_not be_valid
    # end
  end
end
