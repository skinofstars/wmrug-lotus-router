module Deck
  class Templates
    def self.erb(template)
      path = File.expand_path("../templates/#{template}", __FILE__)
      ERB.new(File.read(path)).result(binding)
    end

    def self.nav(args)
      # TODO
      # maybe use something like this in templates
      # nav = Deck::Templates.nav({
      #   before: {
      #     path: '',
      #     name: ''
      #   },
      #   after: {
      #     path: '',
      #     name: ''
      #   }
      # })
    end
  end
end
