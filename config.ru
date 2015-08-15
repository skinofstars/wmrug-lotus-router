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
  run WmRug::Intro
end

rack_routing = Rack::Builder.new do
  use Deck::KeyNav
  use Deck::Layout
  run Rack::URLMap.new(
    '/rack/basics'  => WmRug::RackBasics,
    '/rack/routing' => WmRug::RackRouting
  )
end

lotus_router = Rack::Builder.new do
  require 'lotus/router'

  use Deck::KeyNav
  use Deck::Layout

  run Rack::URLMap.new(
    '/lotus-router' => Lotus::Router.new do
      get '/basics',  to: WmRug::Basics
      get '/dsl',     to: WmRug::DSL


      # RackClassy still reponds to #call, so rock on!
      # mount WmRug::RackClassy, at: '/mounty'

      # using the controller + action syntax
      get '/moduley', to: 'app_controller#index'

      # getting globby .... might be taking the 'y' thing a bit far
      get '/*', to: WmRug::RackGlobby
    end
  )
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
