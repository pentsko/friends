require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { build(:user) }
  let!(:post) { build(:post) }

  context "Get requests" do
    describe "Get new post" do
      it "shoul work" do
        get new_post_path
        expect(response.status).to eq(302)

      end
    end
  end
end
