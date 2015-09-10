require 'spec_helper'

describe RoutingEngine::Router do
  include Rack::Test::Methods

  let(:app) { RoutingEngine::Router.new }

  before do
    app.add '/one', TestRack::Pong.new("GET"), methods: :GET
    app.add '/one', TestRack::Pong.new("PUT"), methods: :PUT
    app.add '/one', TestRack::Pong.new("POST"), methods: :POST
    app.add '/one', TestRack::Pong.new("PATCH"), methods: :PATCH
    app.add '/one', TestRack::Pong.new("DELETE"), methods: :DELETE

    app.add '/two', TestRack::Pong.new("2.0"), methods: %w(GET POST)
    app.add '/two', TestRack::Pong.new("2.1")
  end

  context 'Single method' do
    it 'matches GET method' do
      get('/one').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq 'GET'
      end
    end

    it 'matches PUT method' do
      put('/one').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq 'PUT'
      end
    end

    it 'matches POST method' do
      post('/one').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq 'POST'
      end
    end

    it 'matches PATCH method' do
      patch('/one').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq 'PATCH'
      end
    end

    it 'matches DELETE method' do
      delete('/one').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq 'DELETE'
      end
    end
  end

  context 'Multiple methods' do
    it 'matches GET and POST' do
      get('/two').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq '2.0'
      end

      post('/two').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq '2.0'
      end
    end

    it 'matches any-method in order' do
      put('/two').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq '2.1'
      end

      patch('/two').tap do |response|
        expect(response.status).to eq 200
        expect(response.body).to eq '2.1'
      end
    end
  end
end
