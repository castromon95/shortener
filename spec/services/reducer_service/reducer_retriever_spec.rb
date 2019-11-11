require 'rails_helper'

RSpec.describe ReducerService::ReducerRetriever do

  before(:each) do
    build(:reducer).save
    @reducer = Reducer.first
  end

  describe 'Reducer fetcher' do
    it 'fetches when found and increases count' do
      expect(@reducer.count).to eq(0)
      result = ReducerService::ReducerRetriever.execute(@reducer.token)
      expect(result[:success]).to eq(true)
      expect(result[:type]).to eq('success')
      expect(result[:message]).to eq(nil)
      expect(result[:entity]).to eq(@reducer.url)
      @reducer.reload
      expect(@reducer.count).to eq(1)
    end

    it 'redirects to not found route when it does not exists' do
      result = ReducerService::ReducerRetriever.execute('')
      expect(result[:success]).to eq(false)
      expect(result[:type]).to eq('warning')
      expect(result[:message]).to eq('The URL you area looking for does not exist')
      expect(result[:entity]).to eq("#{ENV['FRONT_URL']}not-found")
    end

  end

end
