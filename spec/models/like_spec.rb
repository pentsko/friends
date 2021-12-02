require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:like) {build(:like)}

  it 'expect like to be valid' do
    expect(like).to be_valid
  end

  it 'expect to be valid without user and post' do
    user = nil
    post = nil
    expect(like).to be_valid
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }

  end
end
