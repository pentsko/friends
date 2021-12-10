require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  context "Get requests" do
    describe "GET post" do

      it "GET root/index" do
        get root_path
        expect(response.status).to eq(200)
      end

      it "GET new post" do
        get new_post_path
        expect(response).to redirect_to new_user_session_path
        expect(response).to redirect_to user_session_path
      end

      it 'return all posts' do
        FactoryBot.create(:post, title: 'First', body: 'text', author: 'Jamesis')
        FactoryBot.create(:post, title: 'Second', body: 'second text', author: 'Vincert')

        get posts_all_posts_path

        expect(response).to have_http_status(:success)
        expect(response.status).to eq(200)
      end
    end
  end

  context "POST requests" do
    describe "POST /post" do
      it "create a new post" do
        sign_in user
        # post "/posts"
        # expect(response.status).to eq(200)
      end
    end
  end
end
