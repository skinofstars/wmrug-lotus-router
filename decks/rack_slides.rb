module Deck
  class RackSlides
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if response[0] =~ /Intro/
        response[0] = <<SNIP
<h1>Intro</h1>
<p>A basic Rack app's code can be as simple as this like this</p>

<pre>
app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/html'}, ['Intro']]
end
</pre>

<p><em>note: We're overriding using this middleware to keep the examples clean, while
  providing additional information in the slides.</em></p>

SNIP
      end

      [status, headers, response]
    end
  end
end

