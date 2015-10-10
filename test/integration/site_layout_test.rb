require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	
  test "test root url" do
		get root_path
		assert_response :success
		assert_match /Welcome/i, response.body
	end

end
