require 'minitest/autorun'
require 'lotus/router'
require 'rack/request'

describe Lotus::Router do
  before do
    @router = Lotus::Router.new
  end

  it 'reponds to GET on root' do
    @router.get('/', to: ->(env) {[200, {}, ['Hi!']] })

    app = Rack::MockRequest.new(@router)
    status, headers, response = app.get('/')

    response.body.must_equal 'Hi!'
  end
end
