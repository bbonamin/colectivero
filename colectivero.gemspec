# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "colectivero/version"

Gem::Specification.new do |s|
  s.name        = "colectivero"
  s.version     = Colectivero::VERSION
  s.authors     = ["Bruno Bonamin"]
  s.email       = ["bruno@bonamin.org"]
  s.homepage    = "http://github.com/bbonamin/colectivero"
  s.summary     = %q{API de Cuándo Llega Rosario}
  s.description = %q{API Wrapper para el Cuándo Llega del Ente de Transporte de Rosario}

  s.add_dependency('mechanize', '>= 1.0.0')
  s.add_dependency('json', '>= 1.6.6')

  s.add_development_dependency 'rspec', '~> 2.9'
  s.rubyforge_project = "colectivero"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
