#\ -p 3000 -o 0.0.0.0 -E development

# ^^ rackup will read the first line as config. see `rackup --help`

# grab our apps
Dir["apps/*.rb"].sort.each {|req| require_relative req}

# grab the slide overrides
Dir["decks/*.rb"].sort.each {|req| require_relative req}

# this may want to be app specific?
use Rack::ContentLength

# useful for debug
use Rack::Reloader, 0

use Deck::RackSlides


# ok, we need to see how we can start re-routing afresh from this URLMap. as
# it stands, this is just calling rack apps directly
run Rack::URLMap.new(
  '/'             => WmRug::Intro.new,
  '/rack-routing' => WmRug::RackRouting.new,
  '/lotus-router' => WmRug::LotusRouting.new,
  # '/lotus-app'    => WmRug::LotusApp.new
)
