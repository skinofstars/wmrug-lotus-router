module Deck
  class KeyNav
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      key_nav = <<KEYNAV
<script type="text/javascript">
document.addEventListener('keydown', function(event) {
  if(event.keyCode == 37) {
    var prev = document.querySelectorAll('[rel="previous"]')[0]
    document.location = prev.href
  }
  else if(event.keyCode == 39) {
    var next = document.querySelectorAll('[rel="next"]')[0]
    document.location = next.href
  }
});
</script>
KEYNAV

      response.push(key_nav)

      [status, headers, response]
    end
  end
end
