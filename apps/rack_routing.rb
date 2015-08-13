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

<a href="/" rel="previous">&laquo; Intro </a> &middot; <a href="/rack/routing" rel="next">Rack routing &raquo;</a>

BASICS

      ['200', {'Content-Type' => 'text/html'}, [basics]]
    end
  end

  class RackRouting
    def self.call env

      routing_in_rack = <<ROR
<h1>Rack routing</h1>
<a href="/rack/basics" rel="previous">&laquo; Rack basics </a> &middot; <a href="/lotus/routing" rel="next">Lotus routing &raquo;</a>
ROR

      ['200', {'Content-Type' => 'text/html'}, [routing_in_rack]]
    end
  end
end
