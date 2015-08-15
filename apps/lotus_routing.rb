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
</pre>

<p>
<span class="marginnote">
<table class="marginnotetable">
  <tbody><tr>
    <th>Verb</th>
    <th>Path</th>
    <th>Action</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/identity</td>
    <td>Identity::Show</td>
  </tr>
  <tr>
    <td>GET</td>
    <td>/identity/new</td>
    <td>Identity::New</td>
  </tr>
  <tr>
    <td>POST</td>
    <td>/identity</td>
    <td>Identity::Create</td>
  </tr>
  <tr>
    <td>GET</td>
    <td>/identity/edit</td>
    <td>Identity::Edit</td>
  </tr>
  <tr>
    <td>PATCH</td>
    <td>/identity</td>
    <td>Identity::Update</td>
  </tr>
  <tr>
    <td>DELETE</td>
    <td>/identity</td>
    <td>Identity::Destroy</td>
  </tr>
</tbody></table>
<small><em>member and collection not included</em></small>
</span>
</p>

<pre class="code">
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

<a href="/lotus-router/basics" rel="previous">&laquo; Lotus::Router basics </a> &middot; <a href="/lotus-router/testing" rel="next">Lotus::Router testing &raquo;</a>

DSL

      ['200', {'Content-Type' => 'text/html'}, [dsl]]
    end
  end

  class Testing
    def call(env)
      testing = <<TESTING

<h1>Lotus::Router - testing</h1>

<a href="/lotus-router/dsl" rel="previous">&laquo; Lotus::Router DSL </a> &middot; <a href="/lotus-router/dsl" rel="next">Lotus::Router next? &raquo;</a>

TESTING
      ['200', {'Content-Type' => 'text/html'}, [testing]]
    end
  end

end

