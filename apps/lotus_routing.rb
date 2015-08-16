module WmRug

  class Index
    def self.call(env)
      index = Deck::Templates.erb('lotus_routing/index.html.erb')

      ['200', {'Content-Type' => 'text/html'}, [index]]
    end
  end

  class Basics
    def self.call(env)
      basics = Deck::Templates.erb('lotus_routing/basics.html.erb')

      ['200', {'Content-Type' => 'text/html'}, [basics]]
    end
  end


  class DSL
    def call env
      dsl = Deck::Templates.erb('lotus_routing/dsl.html.erb')

      ['200', {'Content-Type' => 'text/html'}, [dsl]]
    end
  end

  class Testing
    def call(env)
      testing = Deck::Templates.erb('lotus_routing/testing.html.erb')

      ['200', {'Content-Type' => 'text/html'}, [testing]]
    end
  end

end

