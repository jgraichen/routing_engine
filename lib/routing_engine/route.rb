module RoutingEngine
  #
  class Route
    attr_reader :pattern

    def initialize(pattern, target, **options)
      @pattern = Mustermann.new(pattern)
      @target  = target
    end

    def call(env)
      @target.call(env)
    end
  end
end
