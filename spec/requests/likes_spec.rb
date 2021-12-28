require 'rails_helper'

RSpec.describe "Likes", type: :request do

  let!(:user) { create(:user) }

  describe "Post #likes" do
    it "create a new like" do
      FactoryBot.create(:post, title: 'First', body: 'text', author: 'Jamesis')
      sign_in user
      post likes_path, params: { like: { post_id: 1 } }
      expect(response.status).to eq(302)
    end
    # it "expect to flash notice if like not save" do
    #   FactoryBot.create(:post, title: 'First', body: 'text', author: 'Taras')
    #   # sign_in user
    #   post likes_path, params: { like: { post_id: 1 } }
    #
    #   expect(flash[:notice]).to be_present
    # end
  end

  describe "DELETE #like" do

    let!(:post) { create(:post) }
    let!(:likes) { create(:like, user_id: 1, post_id: 1 ) }

    it "delete like" do
      sign_in user
      delete "/likes/#{likes.id}", params: { id: 1}
      expect(response.status).to eq(302)
      expect(response).to redirect_to("/posts/#{post.id}")
    end
  end
end
