require 'rails_helper'

RSpec.describe Admins::SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/admins/sign_in').to route_to('admins/sessions#new')
    end
    it 'routes to #create' do
      expect(post: '/admins/sign_in').to route_to('admins/sessions#create')
    end
    it 'routes to #destroy' do
      expect(delete: '/admins/sign_out').to route_to('admins/sessions#destroy')
    end
  end
end