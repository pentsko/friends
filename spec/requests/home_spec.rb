require 'rails_helper'

RSpec.describe "Homes", type: :request do
  context "Get requests" do
    describe "Get root_path" do
      it "should render home template" do
        get root_path
        expect(response).to render_template("home/index")
      end
    end
  end
end
