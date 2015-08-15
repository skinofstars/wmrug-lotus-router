module Deck
  class Layout
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      # puts response.inspect

      head = <<HEAD
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="/public/tufte.css"/>
  <link rel="icon" type="image/png" href="/public/lotus-icon.png" />
</head>
<body>
HEAD

# content goes here ;)

      foot = <<FOOT
</body>
</html>
FOOT

      response.unshift(head)
      response.push(foot)

      # response[0] = layout.gsub!(/__CONTENT__/, response[0])

      [status, headers, response]
    end
  end
end
