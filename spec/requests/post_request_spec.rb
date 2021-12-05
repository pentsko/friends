require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { build(:user) }
  let!(:post) { build(:post) }

end
