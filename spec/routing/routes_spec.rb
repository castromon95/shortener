require 'rails_helper'

RSpec.describe 'routes', type: :routing do

  describe 'routes' do
    it 'POST /reducers' do
      expect(post: '/reducers').to route_to(format: :json, controller: 'api/v1/reducers', action: 'create', )
    end

    it 'GET /reducers' do
      expect(get: '/reducers').to route_to(format: :json, controller: 'api/v1/reducers', action: 'index')
    end

    it 'GET /:token' do
      expect(get: '/a2Fd').to route_to(format: :json, controller: 'api/v1/reducers', action: 'show', token: 'a2Fd')
    end

    it 'POST /robot' do
      expect(post: '/robot').to route_to(format: :json, controller: 'api/v1/helpers', action: 'robot', )
    end
  end

end
