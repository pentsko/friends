require 'rails_helper'

RSpec.describe Post, type: :model do

  let!(:post) {build(:post)}

  it 'expect post to be valid' do
    expect(post).to be_valid
  end

end
