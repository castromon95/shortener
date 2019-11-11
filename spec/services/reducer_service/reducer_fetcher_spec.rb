require 'rails_helper'

RSpec.describe ReducerService::ReducerFetcher do

  before(:each) do
    build(:reducer).save
    @reducer = Reducer.first
  end

  describe "Reducer fetcher" do
    it "fetches data successfully" do
      result = ReducerService::ReducerFetcher.execute
      expect(result[:success]).to eq(true)
      expect(result[:type]).to eq('success')
      expect(result[:message]).to eq(nil)
      expect(result[:entity].length).to eq(1)
    end

    it "only brings 100 records" do
      200.times do
        ReducerService::ReducerCreator.execute({ url: Faker::Internet.url })
      end
      result = ReducerService::ReducerFetcher.execute
      expect(result[:entity].length).to eq(100)
      expect(Reducer.count).to eq(201)
    end

    it "brings it organized by count ascendant" do
      ReducerService::ReducerCreator.execute({ url: Faker::Internet.url })
      ReducerService::ReducerRetriever.execute(@reducer.token)
      result = ReducerService::ReducerFetcher.execute
      expect(result[:entity].length).to eq(2)
      expect(result[:entity].first.count > result[:entity].second.count).to eq(true)
    end
  end

end
