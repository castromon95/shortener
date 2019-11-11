module ReducerService
  class ReducerCreator < ApplicationService
    attr_reader :reducer_params, :reducer
    def initialize(reducer_params)
      @reducer_params = reducer_params
    end

    def execute
      ActiveRecord::Base.transaction do
        existing_reduced = Reducer.url_exists?(@reducer_params[:url])
        return format_result(existing_reduced, 'Shortened URL already existed!', false) if existing_reduced
        create_reducer
        TitleFetcherJob.perform_later @reducer
      end
      format_result(@reducer, 'New shortened URL generated!')
    end

    private

    def create_reducer
      @reducer = Reducer.new(@reducer_params)
      @reducer.token = generate_token
      @reducer.save!
    end

    def generate_token
      token = SecureRandom.base64(10).tr('+,/=', '')
      index = Reducer.where("? LIKE token || '%'", token).select('LENGTH(token) as count').collect(&:count).max.to_i + 1
      token[0...index]
    end

  end
end