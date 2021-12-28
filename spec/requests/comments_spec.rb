require 'rails_helper'

RSpec.describe "Comments", type: :request do

  let!(:user) { create(:user) }

  describe "POST /comments" do
    it "create new comment" do
      sign_in user
      post "/posts/post_id/comments", params: { comment: { content: "new text" } }
      expect(response.status).to eq(302)
      # expect(response).to reditect_to(post_path(ПОТРІБНО ПЕРЕДАТИ ПАРАМЕТР post_id СЮДИ))
    end

    it "render to post template if content of comment is empty" do
      sign_in user
      post "/posts/post_id/comments", params: { comment: { content: "" } }
      expect(flash[:notice]).to be_present
    end
  end
end
