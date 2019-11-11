require 'rails_helper'

RSpec.describe ReducerService::ReducerTitleFetcher do

  before(:each) do
    build(:reducer).save
    @reducer = Reducer.first
  end

  describe 'Reducer title fetcher' do
    it 'fetches and updates title of reducer correctly' do
      allow(HTTParty).to receive(:get).and_return(instance_double(HTTParty::Response, body: 'This is a body. <title>Test title</title> for testing.'))
      expect(@reducer.title).to eq(nil)
      result = ReducerService::ReducerTitleFetcher.execute(@reducer)
      expect(result).to eq(true)
      @reducer.reload
      expect(@reducer.title).to eq('Test title')
    end
  end

end
