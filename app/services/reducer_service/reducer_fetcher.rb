module ReducerService
  class ReducerFetcher < ApplicationService
    def initialize; end

    def execute
      format_result(Reducer.top_100, nil)
    end

  end
end