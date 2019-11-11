require 'rails_helper'

RSpec.describe HelperService::UrlFetcher do

  describe 'Url fetcher' do
    it 'fetches and creates correctly' do
      expect(Reducer.count).to eq(0)
      allow(HTTParty).to receive(:get).and_return(instance_double(HTTParty::Response, body: 'This is a body. <title>Test title</title> for testing.'))
      result = HelperService::UrlFetcher.execute
      expect(result[:success]).to eq(true)
      expect(Reducer.count > 0).to eq(true)
    end
  end

end
