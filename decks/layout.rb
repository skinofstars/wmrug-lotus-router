module Deck
  class Layout
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      head = <<HEAD
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="/public/tufte.css"/>
  <link rel="stylesheet" href="/public/style.css"/>
  <link rel="icon" type="image/png" href="/public/lotus-icon.png" />
</head>
<body>
HEAD

      foot = <<FOOT
</body>
</html>
FOOT

      # Rack iterates over each item in the response array.
      # This allows us to modify the output by pushing items in to the array.

      response.unshift(head)
      response.push(foot)

      [status, headers, response]
    end
  end
end
