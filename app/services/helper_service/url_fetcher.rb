require 'faker'

module HelperService
  class UrlFetcher < ApplicationService
    attr_reader :attempts, :total
    def initialize
      @attempts = 100
      @achieved = 0
    end

    def execute
      @attempts.times do
        url = Faker::Internet.url
        begin
          HTTParty.get(url)
          result = ReducerService::ReducerCreator.execute({url: url})
          @achieved += 1 if result[:success]
        rescue
          puts "URL didn't respond: #{url}"
        end
      end
      format_result(nil, "Added #{@achieved} urls from #{@attempts} attempts!")
    end

  end
end