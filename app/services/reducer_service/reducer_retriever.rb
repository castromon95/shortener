module ReducerService
  class ReducerRetriever < ApplicationService
    attr_reader :reducer
    def initialize(token)
      @reducer = Reducer.find_by_token(token.to_s)
    end

    def execute
      @reducer ? success : failure
    end

    private

    def success
      ReducerService::ReducerUpdater.execute(@reducer, {count: @reducer.count + 1})
      format_result(@reducer.url)
    end

    def failure
      format_result("#{ENV['FRONT_URL']}not-found", 'The URL you area looking for does not exist', false)
    end

  end
end