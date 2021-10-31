require 'rails_helper'

RSpec.describe 'Affirmations', type: :request do
  let(:user) { create(:user) }
  let(:affirmation) { create(:affirmation) }

  describe '#index' do
    it '正常にアクセスできること' do
      get affirmations_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it '正常にアクセスできること' do
      get new_affirmation_path
      expect(response).to have_http_status(302)
    end
  end

  describe '#show' do
    it '正常にアクセスできること' do
      get affirmation_path(affirmation)
      expect(response).to have_http_status(302)
    end
  end

  describe '#edit' do
    it '正常にアクセスできること' do
      get edit_affirmation_path(affirmation)
      expect(response).to have_http_status(302)
    end
  end
end