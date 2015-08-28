module RoutingEngine
  #
  class Router
    ENV_PARAMS = 'router.params'.freeze

    def initialize
      @routes  = []
      @tainted = false
      @mutex   = Mutex.new
    end

    def add(*args, **kwargs, &block)
      if args.first.is_a?(Route)
        @routes << route
      else
        @routes << Route.new(*args, **kwargs, &block)
      end

      @tainted = true
    end

    def call(env)
      setup!

      @engine.recognize(env).each do |match|
        env[ENV_PARAMS] = match.params

        catch(:pass) { return match.route.call env }
      end

      [404, {}, EMPTY]
    end

    private

    def setup!
      @mutex.synchronize do
        @engine = Engine.new(@routes.dup) if @tainted
      end
    end
  end
end
