class CleanFeedsWorker
  include Sidekiq::Worker

  def perform(*args)
    Feed.clean
  end
end
