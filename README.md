# RoutingEngine

Flexible low-level Rack Routing Engine.

## Development goals

* Flexible routing:
  Routing based on path, domain, methods and headers for Hypermedia and e.g. Content-Type API versioning.
* Parameter handling:
  Restrict, filter and parse query and path parameters.
* Expose rich route:
  Allow lookup of a Route, not just a string URL or PATH, to support e.g. URL templates, partial expanded URLs etc.
* No DSL:
  As a low-level engine it should not try to expose a nice builder API. That's part of whoever is integrating RoutingEngine into a framework.

## Usage

TODO

## License

Copyright (c) 2015 Jan Graichen. [MIT License](http://opensource.org/licenses/MIT), see LICENSE for more details.
