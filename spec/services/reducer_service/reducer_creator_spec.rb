require 'rails_helper'

RSpec.describe ReducerService::ReducerCreator do

  before(:each) do
    build(:reducer).save
    @reducer = Reducer.first
  end

  describe 'Reducer creator' do
    it 'creates successfully' do
      result = ReducerService::ReducerCreator.execute({ url: Faker::Internet.url })
      expect(result[:success]).to eq(true)
      expect(result[:type]).to eq('success')
      expect(result[:message]).to eq('New shortened URL generated!')
      expect(result[:entity]).to be_valid
    end

    it 'does not create with duplicate url' do
      result = ReducerService::ReducerCreator.execute({ url: @reducer.url })
      expect(result[:success]).to eq(false)
      expect(result[:type]).to eq('warning')
      expect(result[:message]).to eq('Shortened URL already existed!')
      expect(result[:entity]).to eq(@reducer)
    end

    it 'can handle token length increase' do
      200.times do
        result = ReducerService::ReducerCreator.execute({ url: Faker::Internet.url })
        expect(result[:success]).to eq(true)
      end
      reducer = Reducer.order(token: :desc).limit(1).first
      expect(reducer.token.length > 1).to eq(true)
      expect(Reducer.count).to eq(201)
    end
  end

end
