module ReducerService
  class ReducerUpdater < ApplicationService
    attr_reader :reducer, :reducer_params
    def initialize(reducer, reducer_params)
      @reducer = reducer
      @reducer_params = reducer_params
    end

    def execute
      ActiveRecord::Base.transaction do
        @reducer.update!(@reducer_params)
      end
      format_result(@reducer)
    end

  end
end