require 'rails_helper'

RSpec.describe "Homes", type: :request do

  context "GET requests" do
    describe "GET root_path" do
      it "should render home template" do
        get root_path
        expect(response).to render_template("home/index")
      end

      it "show contact page" do
        get home_contacts_path
        expect(response).to have_http_status(:success)
      end

      it "show about page" do
        get home_about_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
