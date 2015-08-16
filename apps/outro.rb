module WmRug
  class Outro
    def self.call env

    outro = <<TEXT
<h1>Lotus::Router - summary</h1>

<p>You can always keep things really simple and just use Rack and it's middlewares.
It's a great software stack.</p>

<p>Lotus::Router is a nice drop-in if you easily want more routing power with minimal overhead.</p>

<p>Lotus::Router provides many common conveniences that would be familiar to a Rails developer.</p>

<p>Within a Lotus application, Lotus::Router really helps to maintain separation of concerns.</p>

<h3>Thanks!</h3>
<p>Kevin Carmody <a href="https://twitter.com/skinofstars">@skinofstars</a></p>

<nav class="slidenav">
<a href="/lotus-app/resources" rel="previous">&laquo; Lotus routing - resources</a>
</nav>

TEXT

      ['200', {'Content-Type' => 'text/html'}, [outro]]
    end
  end
end
