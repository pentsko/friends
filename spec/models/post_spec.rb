require 'rails_helper'

RSpec.describe Post, type: :model do

  let!(:post) {build(:post)}

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

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end
end
