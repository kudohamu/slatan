# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slatan/version'

Gem::Specification.new do |spec|
  spec.name          = "slatan"
  spec.version       = Slatan::VERSION
  spec.authors       = ["kudohamu"]
  spec.email         = ["kudohamu91086[a]gmail.com"]

  spec.summary       = %q{bot module for Slack}
  spec.description   = %q{Gem to create bot for Slack easily and flexibly.}
  spec.homepage      = "https://github.com/kudohamu/slatan"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "eventmachine"
  spec.add_dependency "faye-websocket"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
