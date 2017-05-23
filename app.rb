require 'cuba'
require 'cuba/render'
require 'tilt/haml'
require 'byebug'
require 'rack'
require 'rack/static'
require 'haml'

Cuba.plugin Cuba::Render

Cuba.use Rack::Static,
         urls: ['css']

Cuba.settings[:render][:template_engine] = 'haml'
Cuba.settings[:render][:layout] = 'layout'

Cuba.define do
  on get do
    on root do
      res.write view('landing')
    end

    on 'public/css', extension('css') do
      res['Content-Type'] = 'text/css'
      res.write File.read(".#{req.path}")
    end
  end
end
