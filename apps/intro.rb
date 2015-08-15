module WmRug
  class Intro
    def self.call env

      req = Rack::Request.new(env)
      if req.path == "/"

      intro = <<TEXT
<h1>A Lotus::Router primer</h1>
<h2>Intro</h2>

<p>Welcome to a short introduction to Lotus::Router.</p>
<p>We're going to cover a few things.</p>

<ol>
  <li>General Rack intro.</li>
  <li>Basic routing in Rack apps.</li>
  <li>Using Lotus::Router with Rack apps.</li>
  <li>Routing in a Lotus application.</li>
</ol>

<a href="/rack/basics" rel="next">Rack basics &raquo;</a>

TEXT

        ['200', {'Content-Type' => 'text/html'}, [intro]]
      else
        ['404', {'Content-Type' => 'text/html'}, ["Not found"]]
      end
    end
  end
end
