class TitleFetcherJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ReducerService::ReducerTitleFetcher.execute(args.first)
  end
end
