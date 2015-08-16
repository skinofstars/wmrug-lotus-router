module Deck
  class KeyNav
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      key_nav = <<KEYNAV
<script type="text/javascript" src="/public/script.js"></script>
KEYNAV

      response.push(key_nav)

      [status, headers, response]
    end
  end
end
