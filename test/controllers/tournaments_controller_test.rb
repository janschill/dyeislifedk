# frozen_string_literal: true

require "test_helper"

class TournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tournaments_index_url
    assert_response :success
  end
end
