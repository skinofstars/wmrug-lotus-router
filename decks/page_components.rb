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
  <link rel="stylesheet" href="/public/style.css"/>
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

      [status, headers, response]
    end
  end

  class Templates
    def self.erb(template)
      path = File.expand_path("../templates/#{template}", __FILE__)
      ERB.new(File.read(path)).result(binding)
    end

    def self.nav(args)
      # TODO

      # maybe use something like
      # nav = Deck::Templates.nav({
      #   before: {
      #     path: '',
      #     name: ''
      #   },
      #   after: {
      #     path: '',
      #     name: ''
      #   }
      # })
    end
  end
end
