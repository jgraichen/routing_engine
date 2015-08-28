require 'spec_helper'

describe RoutingEngine::Router do
  include Rack::Test::Methods

  let(:app) { RoutingEngine::Router.new }

  it 'routes things' do
    app.add '/hello/:world', -> (env) {
      [200, {}, "Hello #{env['router.params']['world']}!"]
    }

    get('/hello/world').tap do |response|
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello world!'
    end
  end
end
