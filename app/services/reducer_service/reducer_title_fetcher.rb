module ReducerService
  class ReducerTitleFetcher < ApplicationService
    attr_reader :reducer
    def initialize(reducer)
      @reducer = reducer
    end

    def execute
      ActiveRecord::Base.transaction do
        response = HTTParty.get(@reducer.url)
        title = Nokogiri::HTML::Document.parse(response.body).title.to_s
        ReducerService::ReducerUpdater.execute(@reducer, {title: title})
      end
      true
    end

  end
end