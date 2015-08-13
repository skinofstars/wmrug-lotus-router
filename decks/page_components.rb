module Deck
  class Layout
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      layout = <<LAYOUT
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="/public/tufte.css"/>
</head>
<body>
  __CONTENT__
</body>
</html>
LAYOUT

      response[0] = layout.gsub!(/__CONTENT__/, response[0])

      [status, headers, response]
    end
  end
end
