module WmRug
  class Intro
    def call env
      ['200', {'Content-Type' => 'text/html'}, ['Intro']]
    end
  end
end
