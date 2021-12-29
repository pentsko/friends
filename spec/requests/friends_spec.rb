require 'rails_helper'

RSpec.describe "Friends", type: :request do

  let!(:user) { create(:user) }
  before { sign_in user }

  describe "GET /friends" do
    it "render user template" do
      get friends_path
      expect(response).to render_template("friends/index")
    end

    it 'render users list' do
      get list_users_path
      expect(response).to render_template("list_users")
    end

    it 'render friends list' do
      get friends_list_path
      expect(response).to render_template("list_friends")
    end

    it 'should render show template' do
      get "/user/#{user.id}"
      expect(response).to render_template(:show)
    end
  end

  describe "POST /friends" do
    it "add user to current_user friendslist" do
    post "/friends", params:  { friend_id: "1"}
    expect(response).to redirect_to friends_list_path
    end
  end

  describe "DELETE /friends" do
    it "delete user from frindslist" do
      delete "/friends/#{user.id}", params: { destroy_id: "1" }
      expect(response).to redirect_to friends_list_path
    end

    it "delete specific user from data" do
      delete "/user/#{user.id}", params: {id: 1}
      expect(response).to redirect_to list_users_path
    end
  end
end
