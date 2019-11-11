require 'rails_helper'

RSpec.describe Api::V1::HelpersController, type: :controller do
  render_views

  describe 'url fetcher robot' do
    it 'renders the robot template' do
      allow(HTTParty).to receive(:get).and_return(instance_double(HTTParty::Response, body: 'This is a body. <title>Test title</title> for testing.'))
      post :robot, format: :json
      expect(response).to render_template('robot')
      body = JSON.parse(response.body)
      expect(body['success']).to eq(true)
    end
  end

end
