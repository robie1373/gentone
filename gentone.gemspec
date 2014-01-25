# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gentone/version'

Gem::Specification.new do |spec|
  spec.name          = "gentone"
  spec.version       = Gentone::VERSION
  spec.authors       = ["Robie Lutsey"]
  spec.email         = ["robie1373@gmail.com"]
  spec.description   = %q{play dits and dahs for CW aka morse code. Feed it a string and it plays sounds. os x only.}
  spec.summary       = %q{play dits and dahs for CW aka morse code}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1.1"
  spec.add_development_dependency "rspec"

  spec.add_dependency "coreaudio"
  spec.add_dependency "querinator", "~> 0.0.2"
  spec.add_dependency "highline", "~> 1.6.20"
end
