require 'cuba'
require 'cuba/render'
require 'tilt/haml'
require 'byebug'
require 'rack'
require 'haml'
require 'redis'

Cuba.plugin Cuba::Render

Cuba.settings[:render][:template_engine] = 'haml'
Cuba.settings[:render][:layout] = 'layout'

Cuba.define do
  redis = Redis.new

  on get do
    on root do
      @fun_things = redis.keys.each_with_object({}) do |k, h|
        h[k] = redis.get k
      end
      
      res.write view('landing')
    end

    on 'public/css', extension('css') do
      res['Content-Type'] = 'text/css'
      res.write File.read(".#{req.path}")
    end
  end

  on post do
    on 'new_thing'  do
      on param('thing'), param('description') do |thing, desc|
        redis.set(thing, desc)
        res.redirect('/')
      end
    end
  end
end
