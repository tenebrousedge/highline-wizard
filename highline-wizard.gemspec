# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'highline/wizard/version'

Gem::Specification.new do |spec|
  spec.name          = "highline-wizard"
  spec.version       = Highline::Wizard::VERSION
  spec.authors       = ["Guillermo Álvarez"]
  spec.email         = ["guillermo@cientifico.net"]
  spec.description   = %q{Interactive array based wizzard bassed in highline}
  spec.summary       = %q{Let the people choose and focus in your program}
  spec.homepage      = "http://github.com/guillermo/highline_wizzard"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "highline"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
