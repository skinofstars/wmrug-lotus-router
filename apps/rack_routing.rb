module WmRug
  class RackBasics
    def self.call env
      basics = Deck::Templates.erb('rack_routing/basics.html.erb')

      ['200', {'Content-Type' => 'text/html'}, [basics]]
    end
  end

  class RackRouting
    def self.call env
      routing_in_rack = Deck::Templates.erb('rack_routing/routing.html.erb')

      ['200', {'Content-Type' => 'text/html'}, [routing_in_rack]]
    end
  end

  class RackRoutingTwo
    def self.call env
      rack_routing_two = Deck::Templates.erb('rack_routing/routing_two.html.erb')

      ['200', {'Content-Type' => 'text/html'}, [rack_routing_two]]
    end
  end
end
