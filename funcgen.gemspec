# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'funcgen/version'

Gem::Specification.new do |spec|
  spec.name          = "funcgen"
  spec.version       = Funcgen::VERSION
  spec.authors       = ["Jared Szechy"]
  spec.email         = ["jared.szechy@gmail.com"]

  spec.summary       = %q{CLI tool for Agilent function generators.}
  spec.homepage      = "https://github.com/szechyjs/funcgen"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
