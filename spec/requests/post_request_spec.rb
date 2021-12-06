require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { build(:user) }
  let!(:post) { build(:post) }

  context "Get requests" do
    describe "GET /post" do

      it "GET new post" do
        get new_post_path
        expect(response.status).to eq(302)
      end
    end
  end

  it 'return all posts' do
   FactoryBot.create(:post, title: 'First', body: 'text', author: 'Jamesis')
   FactoryBot.create(:post, title: 'Second', body: 'second text', author: 'Vincert')

    get '/posts/all_posts'

    expect(response).to have_http_status(:success)
    expect(response.status).to eq(200)
  end

  # describe 'POST /posts' do
  #   it 'create a new post' do
  #
  #     post '/posts'
  #          # post: { title: 'Styding', body: 'Interesting it develop'}
  #     FactoryBot.create(:post, title: 'Second', body: 'second text', author: 'Vincert')
  #
  #     expect(response).to have_http_status(:success)
  #   end
  # end
#  Don't pass tests bocouse user must first log in....
end
