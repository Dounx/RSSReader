=begin
All this tests need network connection!

require 'test_helper'
class FeedWorkerTest < ActiveSupport::TestCase
  setup do
    @link = 'https://www.ithome.com/rss/'
  end

  test 'should add a feed' do
    assert_difference('Feed.count') do
      RefreshFeedsWorker.new.perform(@link)
    end
  end

  test 'should not add a feed if the feed existed ' do
    RefreshFeedsWorker.new.perform(@link)
    assert_no_difference('Feed.count') do
      RefreshFeedsWorker.new.perform(@link)
    end
  end

  test 'should add items' do
    last_count = Item.count
    RefreshFeedsWorker.new.perform(@link)
    assert_not_equal last_count, Item.count
  end


  test 'should not add items if items exist' do
    RefreshFeedsWorker.new.perform(@link)
    assert_no_difference('Item.count') do
      RefreshFeedsWorker.new.perform(@link)
    end
  end
end
=end
