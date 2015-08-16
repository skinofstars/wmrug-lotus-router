#\ -p 3001 -o 0.0.0.0 -E development

require './config/environment'
run Lotus::Container.new
