module RoutingEngine
  #
  class Route
    attr_reader :pattern, :methods

    def initialize(pattern, target, methods: [])
      @pattern = Mustermann.new(pattern)
      @methods = Array(methods).map(&:to_s).map(&:upcase)

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
