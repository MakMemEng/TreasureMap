require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "#" do
    it '正常にアクセスできること' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

end
