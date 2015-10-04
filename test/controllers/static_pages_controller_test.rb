require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	test "test root url" do
		get root_url
		assert_response :success
		assert_match /Welcome/i, response.body
	end

end
