require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe '#' do
    it '正常にアクセスできること' do
      get users_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe '#show' do
    it '正常にアクセスできること' do
      get user_path(user)
      expect(response).to have_http_status(302)
    end
  end

  describe '#edit' do
    it '正常にアクセスできること' do
      get edit_user_path(user)
      expect(response).to have_http_status(302)
    end
  end

  describe '#guest' do
    it '正常にアクセできること' do
      get users_guest_sign_in_path
      expect(response).to have_http_status(302)
    end
  end

end