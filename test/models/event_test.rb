require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @day_event = events(:all_day_event)
    @event = events(:event)
  end

  test "should be valid" do
    assert @day_event.valid?
    assert @event.valid?
  end

  test "require title" do
    @day_event.title = "    "
    assert_not @day_event.valid?
    
    @event.title = "    "
    assert_not @event.valid?
  end

  test "require start datetime" do
    @day_event.start_datetime = ""
    assert_not @day_event.valid?
    
    @event.start_datetime = ""
    assert_not @event.valid?
  end

  test "require end datetime" do
    @day_event.end_datetime = ""
    assert_not @day_event.valid?
    
    @event.end_datetime = ""
    assert_not @event.valid?
  end

  test "require user" do
    @day_event.user_id = nil
    assert_not @day_event.valid?
  end

end
