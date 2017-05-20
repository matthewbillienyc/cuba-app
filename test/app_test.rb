require 'cuba/test'
require_relative '../app/app.rb'

scope do
  test "Homepage" do
    get "/"

    follow_redirect!

    assert_equal "Hello there!", last_response.body
  end
end
