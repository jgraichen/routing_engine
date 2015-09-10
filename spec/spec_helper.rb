require 'bundler/setup'
require 'rack/test'

require 'routing_engine'

module TestRack
  class One
    def self.call(_env)
      [200, {}, 'Hello One!']
    end
  end

  class Two
    def call(_env)
      [200, {}, 'Hello Two!']
    end
  end

  Pong = Struct.new(:reply) do
    def call(_env)
      [200, {}, reply]
    end
  end
end
