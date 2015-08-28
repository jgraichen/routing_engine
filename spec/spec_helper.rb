require 'bundler/setup'
require 'rack/test'

require 'routing_engine'

module TestRack
  class One
    def self.call(env)
      [200, {}, 'Hello One!']
    end
  end

  class Two
    def call(env)
      [200, {}, 'Hello Two!']
    end
  end
end
