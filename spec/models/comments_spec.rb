require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "expect comment has content" do
    comment = Comment.create(content: "New comment")

    expect(comment.content).to eq 'New comment'
  end
end
