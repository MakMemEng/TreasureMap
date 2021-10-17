require 'rails_helper'

RSpec.describe Admins::RegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/admins/sign_up').not_to be_routable
    end
    it 'routes to #create' do
      expect(post: '/admins').not_to be_routable
    end
    it 'routes to #edit' do
      expect(get: '/admins/edit').not_to be_routable
    end
    it 'routes to #update' do
      expect(put: '/admins').not_to be_routable
    end
    it 'routes to #destroy' do
      expect(delete: '/admins').not_to be_routable
    end
    it 'routes to #cancel' do
      expect(get: '/admins/cancel').not_to be_routable
    end
  end
end