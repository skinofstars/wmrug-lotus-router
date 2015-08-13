#\ -p 3000 -o 0.0.0.0 -E development
# ^^ rackup will read the first line as config. see `rackup --help`

# grab our apps
Dir["apps/*.rb"].sort.each {|req| require_relative req}

# grab the slide overrides
Dir["decks/*.rb"].sort.each {|req| require_relative req}

use Rack::Reloader, 0

intro = Rack::Builder.new do
  use Rack::ContentLength
  use Rack::Static, :urls => ["/public"]
  use Deck::Layout
  run WmRug::Intro
end

rack_routing = Rack::Builder.new do
  use Rack::ContentLength
  # use Deck::RackSlides # not sure if we're gonna use this now
  use Rack::Static, :urls => ["/public"]
  use Deck::Layout
  run Rack::URLMap.new(
    '/rack/basics'  => WmRug::RackBasics,
    '/rack/routing' => WmRug::RackRouting
  )
end

lotus_router = Rack::Builder.new do
  # run WmRug::LotusRouting.new
  run lambda { |env| ['200', {}, ['lotus_router']] }
end

lotus_app = Rack::Builder.new do
  # run Lotus::Container.new
  run lambda { |env| ['200', {}, ['lotus_app']] }
end

outro = Rack::Builder.new do
  # run WmRug::Outro.new
  run lambda { |env| ['200', {}, ['outro']] }
end



# cascade will try new apps until it hits non [404, 405]
run Rack::Cascade.new([
  intro,
  rack_routing,
  lotus_router,
  lotus_app,
  outro,
  lambda { |env| ["404", {}, ["Not found"]] }
])
