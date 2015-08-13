module WmRug
  class LotusRouting
    def call env
      ['200', {'Content-Type' => 'text/html'}, ['Lotus']]
    end
  end
end
