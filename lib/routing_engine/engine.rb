module RoutingEngine
  #
  class Engine
    def initialize(routes)
      @routes = routes
    end

    def recognize(env)
      request = ::Rack::Request.new(env)
      method  = request.request_method.upcase
      path    = request.path_info

      @routes.each_with_object([]) do |route, results|
        next unless (match = route.pattern.match(path))

        results << Match.new(route, match)
      end
    end

    Match = Struct.new(:route, :params)
  end
end
