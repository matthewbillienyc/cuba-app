require 'cuba/test'
require './app.rb'

scope do
  test "Homepage" do
    get "/"

    follow_redirect!

    assert_equal "Hello there!", last_response.body
  end
end
