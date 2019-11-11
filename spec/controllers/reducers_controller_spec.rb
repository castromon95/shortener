require 'rails_helper'

RSpec.describe Api::V1::ReducersController, type: :controller do
  render_views

  before(:each) do
    build(:reducer).save
    @reducer = Reducer.first
  end

  describe 'GET index' do
    it 'renders the index template' do
      get :index, format: :json
      expect(response).to render_template('index')
      body = JSON.parse(response.body)
      expect(body['success']).to eq(true)
      expect(body['user']['entries'].length).to eq(1)
      expect(body['user']['entries'].first).to eq({'count' => @reducer.count, 'short_url' => @reducer.reduced_url, 'title' => @reducer.title, 'url' => @reducer.url})
    end

    it 'get ok status code and json' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe 'GET show' do
    it 'get redirect status code' do
      get :show, params: {token: @reducer.token}, format: :json
      expect(response).to have_http_status(:moved_permanently)
      expect(response.headers['Location']).to eq(@reducer.url)
    end
  end

  describe 'POST create' do
    it 'renders the create template' do
      url = Faker::Internet.url
      post :create, params: {reducer: { url: url }}, format: :json
      expect(response).to render_template('create')
      reducer = Reducer.find_by_url(url)
      body = JSON.parse(response.body)
      expect(body['success']).to eq(true)
      expect(body['user']['shortened_url']).to eq(reducer.reduced_url)
      expect(body['user']['original_url']).to eq(url)
    end

    it 'get ok status code and json' do
      post :create, params: {reducer: { url: Faker::Internet.url }}, format: :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq 'application/json'
    end
  end

end
