require 'cuba'
require 'cuba/safe'

Cuba.use Rack::Session::Cookie, secret: "PLACEHOLDER"

Cuba.plugin Cuba::Safe

Cuba.define do
  on get do
    on "hello" do
      res.write "Hello there!"
    end

    on root do
      res.redirect "/hello"
    end
  end
end
