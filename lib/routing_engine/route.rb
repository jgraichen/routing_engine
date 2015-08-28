module RoutingEngine
  #
  class Route
    attr_reader :pattern

    def initialize(pattern, target, **_options)
      @pattern = Mustermann.new(pattern)

      if target.respond_to?(:call)
        @target = target
      elsif target.method_defined?(:call)
        @target = target.new
      else
        fail 'Invalid target'
      end
    end

    def call(env)
      @target.call(env)
    end
  end
end
