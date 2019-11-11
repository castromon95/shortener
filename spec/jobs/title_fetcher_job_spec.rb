require 'rails_helper'

RSpec.describe TitleFetcherJob, type: :job do

  before(:each) do
    build(:reducer).save
    @reducer = Reducer.first
  end

  describe 'perform_later' do
    it 'fetches title' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        TitleFetcherJob.perform_later(@reducer)
      }.to have_enqueued_job.with(@reducer).on_queue('default')
    end
  end
end
