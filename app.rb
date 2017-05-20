require 'cuba'
require 'cuba/safe'
require 'cuba'
require 'cuba/render'
require 'tilt/haml'
require 'haml'

Cuba.use Rack::Session::Cookie, secret: 'PLACEHOLDER'

Cuba.plugin Cuba::Render
Cuba.plugin Cuba::Safe

Cuba.settings[:render][:template_engine] = 'haml'

Cuba.define do
  on get do
    on 'hello' do
      res.write view('landing')
    end

    on root do
      res.redirect '/hello'
    end
  end
end
