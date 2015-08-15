module WmRug

  class Basics
    # , using lambdas
    def self.call(env)
      basics = <<BASICS
<h1>Lotus::Router - basics</h1>

<p>You can treat it as a Rack middleware, similar to Rack::URLMap.</p>

<pre class="code">
run Lotus::Router.new do
  get '/lotus-router/basics', to: lambda {|env| [200, {}, ['Hello world!']]}
  get '/lotus-router/dsl', to: WmRug::LotusDSL
end
</pre>

<p>As long as you understand how Rack apps work, this is a simple drop-in</p>

<a href="/rack/routing" rel="previous">&laquo; Rack routing </a> &middot; <a href="/lotus-router/dsl" rel="next">Lotus::Router DSL &raquo;</a>

BASICS

      ['200', {'Content-Type' => 'text/html'}, [basics]]
    end
  end


  class DSL
    def call env
      dsl = <<DSL
<h1>Lotus::Router - DSL</h1>

<pre class="code">
Lotus::Router.new do
  get '/intro',         to: WmRug::Intro
  get '/rack/basics',   to: WmRug::Basics.new
  get '/users',         to: 'users#index'
  post '/users/:id',    to: 'users#update'

  redirect '/legacy', to: '/'

  mount Api::App, at: '/api'

  namespace 'admin' do
    get '/users', to: Users::Index
  end

  # resource maps to usual HTTP verbs
  resource 'identity' do
    member do
      get '/avatar'
    end

    collection do
      get '/api_keys'
    end
  end
end
</pre>

<a href="/lotus-router/basics" rel="previous">&laquo; Lotus::Router basics </a> &middot; <a href="/lotus-router/dsl" rel="next">Lotus::Router next? &raquo;</a>

DSL

      ['200', {'Content-Type' => 'text/html'}, [dsl]]
    end
  end




  class RackGlobby
    def call(env)
      # puts env

      # just using rack hash
      req = env['router.request']

      # or rack's helper
      req_helper = Rack::Request.new(env)

      # rack response helper
      res = Rack::Response.new
      res.write "mmm, globby \n #{req.path} \n #{req_helper.path_info}"
      res.finish
    end
  end



end


# # an idea to remove the router from config.ru
# class LotusRouterInit
#   def initialize
#     lapp = Lotus::Router.new do
#       # basic rack
#       get '/min', to: ->(env) { [200, {"Content-Type" => "text/html"}, ['<h1>Welcome to Lotus::Router!</h1> <a href="">link</a>']] }

#       # get '/lamy', to: rack_app
#       get '/classy', to: WmRug::RackClassy.new # or just RackClassy

#       # RackClassy still reponds to #call, so rock on!
#       mount WmRug::RackClassy, at: '/classymnt' #

#       # using the controller + action syntax
#       get '/moduley', to: 'app_controller#index'

#       get '/*', to: WmRug::RackGlobby
#     end

#   end
# end
