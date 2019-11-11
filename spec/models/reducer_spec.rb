require 'rails_helper'

RSpec.describe Reducer, type: :model do

  before(:each) do
    build(:reducer).save
    @reducer = Reducer.first
  end

  it 'has a valid factory' do
    reducer = build(:reducer)
    expect(reducer).to be_valid
  end

  describe 'update validations' do
    it 'is not valid without a token' do
      reducer = Reducer.new(url: Faker::Internet.url)
      expect(reducer).not_to be_valid
      expect(reducer.errors.full_messages.first).to eq('Token field is mandatory')
    end

    it 'is not valid without a url' do
      reducer = Reducer.new(token: SecureRandom.base64(4).tr('+,/=', ''))
      expect(reducer).not_to be_valid
      expect(reducer.errors.full_messages.first).to eq('Url field is mandatory')
      expect(reducer.errors.full_messages.second).to eq('Url must be at least 10 characters long')
      expect(reducer.errors.full_messages.third).to eq('Url must be valid')
    end

    it 'is not valid without a valid url' do
      reducer = Reducer.new(token: SecureRandom.base64(4).tr('+,/=', ''), url: 'htt://google.com')
      expect(reducer).not_to be_valid
      expect(reducer.errors.full_messages.first).to eq('Url must be valid')
    end
  end

  describe 'update validations' do
    it 'is not valid without a not numeric count' do
      @reducer.update(count: 'A')
      expect(@reducer).not_to be_valid
      expect(@reducer.errors.full_messages.first).to eq('Count must be a positive valid integer.')
    end

    it 'is not valid without a number below 0' do
      @reducer.update(count: -1)
      expect(@reducer).not_to be_valid
      expect(@reducer.errors.full_messages.first).to eq('Count must be a positive valid integer.')
    end

    it 'is not valid without a non integer number' do
      @reducer.update(count: 1.1)
      expect(@reducer).not_to be_valid
      expect(@reducer.errors.full_messages.first).to eq('Count must be a positive valid integer.')
    end
  end

  describe 'class methods' do
    it 'creates a valid short url' do
      expect(@reducer.reduced_url).to eq("#{Rails.configuration.action_mailer.default_url_options[:host]}#{@reducer.token}")
    end
  end
end
