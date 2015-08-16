module WmRug
  class RackBasics
    def self.call env

      basics = <<BASICS
<h1>Rack basics</h1>

<p>Rack is a Ruby webserver interface. It was intended to provide minimal API
  for connecting web servers and web frameworks<label for="1" class="margin-toggle sidenote-number"></label>.
    <span class="sidenote">
      Creator, Christian Neukirchen's <a href="http://chneukirchen.org/blog/archive/2007/02/introducing-rack.html">Introducing Rack</a>
    </span></p>

<p>A <strong>rack app</strong> is an object which implements two required behaviours:</p>
<ol>
<li>It responds to #call, and takes an environment hash as a param.</li>
<li>It returns an array of; [<em>status number</em>, <em>headers hash</em>, <em>enumberable content</em>]</li>
</ol>

<p>In its simplest form</p>
<pre class="code">
  lambda { |env| [200, {'Content-Type' => 'text/html'}, ["Hello world!"]] }
</pre>

<nav class="slidenav">
  <a href="/" rel="previous">&laquo; Intro </a> &middot;
  <a href="/rack/routing" rel="next">Rack routing &raquo;</a>
</nav>

BASICS

      ['200', {'Content-Type' => 'text/html'}, [basics]]
    end
  end

  class RackRouting
    def self.call env

      routing_in_rack = <<ROR
<h1>Rack routing</h1>

<h2>Method 1. Do it in the object</h2>
<pre class="code">
class SelfRoutingRackApp
  def self.call(env)
    req = Rack::Request.new(env)
    case req.path
    when "/"
      Rack::Response.new("Hello world!")
    when /^\/name\/(.*)/
      Rack::Response.new("Hello, \#{$1}!")
    else
      Rack::Response.new("Not found", 404)
    end
  end
end
</pre>

<h2>Method 2. Rack::URLMap</h2>
<pre class="code">
run Rack::URLMap.new(
  '/rack/basics'  => WmRug::RackBasics,
  '/rack/routing' => WmRug::RackRouting
)
</pre>

<nav class="slidenav">
  <a href="/rack/basics" rel="previous">&laquo; Rack basics </a> &middot;
  <a href="/lotus-router" rel="next">Lotus::Router &raquo;</a>
</nav>

ROR

      ['200', {'Content-Type' => 'text/html'}, [routing_in_rack]]
    end
  end
end
