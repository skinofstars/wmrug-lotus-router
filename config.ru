#\ -p 3000 -o 0.0.0.0 -E development
# ^^ rackup will read the first line as config. see `rackup --help`

# grab our apps
Dir["apps/*.rb"].sort.each {|req| require_relative req}

# grab the layouts and slide overrides
Dir["decks/*.rb"].sort.each {|req| require_relative req}

# Reload .rb files on change. Always add ContentLength header. Server static assets.
use Rack::Reloader, 0
use Rack::ContentLength
use Rack::Static, :urls => ["/public"]

intro = Rack::Builder.new do
  use Deck::KeyNav
  use Deck::Layout
  run WmRug::Intro # we in-app path checking for '/'
end

rack_routing = Rack::Builder.new do
  use Deck::KeyNav
  use Deck::Layout
  run Rack::URLMap.new(
    '/rack/basics'      => WmRug::RackBasics,
    '/rack/routing'     => WmRug::RackRouting,
    '/rack/routing_two' => WmRug::RackRoutingTwo
  )
end

lotus_router = Rack::Builder.new do
  require 'lotus/router'

  use Deck::KeyNav
  use Deck::Layout

  run Rack::URLMap.new(
    '/lotus-router' => Lotus::Router.new do
      get '/',        to: WmRug::Index
      get 'basics',   to: WmRug::Basics
      get 'dsl',      to: WmRug::DSL
      get 'testing',  to: WmRug::Testing
    end
  )
end

lotus_app = Rack::Builder.new do
  require './lotus-app/config/environment'

  run Rack::URLMap.new(
    '/lotus-app' => Lotus::Container.new
  )
end

outro = Rack::Builder.new do
  use Deck::KeyNav
  use Deck::Layout
  router = Lotus::Router.new do
    get '/outro', to: WmRug::Outro
  end
  run router
end



# cascade will try new apps until it hits non [404, 405]
run Rack::Cascade.new([
  intro,
  rack_routing,
  lotus_router,
  lotus_app,
  outro,
  lambda { |env| ["404", {}, ["Not found"]] } # safer to finish with a 404 that nothing
])
