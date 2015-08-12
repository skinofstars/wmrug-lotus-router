# Lotus::Router

## 1. Rack
- Rack is a ruby webserver interface
- A rack app is an object which implements two required behaviours
  - The object responds to #call, and takes an environment hash as a param
  - The object returns an array; [200, {'Content-Type' => 'text/html'}, ["Hello world!"]]

## 2. Rack routing
- Minimal, always return the same response
- Simple, figure out the response based on environment values
- Rack::URLMap middleware

## 3. Lotus::Router as a rack router  - [TODO: trim this list!]
- Minimal, using lambdas
- Classes, responding to #call
- Globbing
- Mounting (at: '/path')
- Named routes
- Modules, using the controller + action paradigm
- Duck typing
- Params
- Namespacing
- RESTful verbs
- Resources (members, collections)
- Testing

## 4. Lotus::Router in the Lotus framework
- Mounting an app in the Lotus::Container - /config/environment.rb
- App routes /apps/config/routes.rb

## 5. Using the router in conjunction Rails - [IDEA]
