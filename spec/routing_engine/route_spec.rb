require 'spec_helper'

describe RoutingEngine::Router do
  include Rack::Test::Methods

  let(:app) { RoutingEngine::Router.new }

  before do
    app.add '/one', TestRack::One
    app.add '/two', TestRack::Two
    app.add '/three', TestRack::Two.new

    app.add '/hello/:world', -> (env) {
      [200, {}, "Hello #{env['router.params']['world']}!"]
    }
  end

  it 'routes to one' do
    get('/one').tap do |response|
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello One!'
    end
  end

  it 'routes to two' do
    get('/two').tap do |response|
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello Two!'
    end
  end

  it 'routes to three' do
    get('/three').tap do |response|
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello Two!'
    end
  end

  it 'routes to /hello/:world' do
    get('/hello/world').tap do |response|
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello world!'
    end
  end
end
