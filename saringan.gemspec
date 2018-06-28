# frozen_string_literal: true
# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "saringan/version"

Gem::Specification.new do |spec|
  spec.name          = "saringan"
  spec.version       = Saringan::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Reinaldo Olivera (k1ng)"]

  spec.summary       = %q{Simple way to send filter parameters to rails models.}
  spec.description   = %q{Simple way to send filter parameters to rails models.}
  spec.homepage      = "https://github.com/reinaldooli/saringan"
  spec.license       = "MIT"

  spec.files         = Dir["MIT-LICENSE", "README.md", "lib/**/*"]
  spec.test_files    = Dir["spec/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 5.0"

  spec.add_development_dependency "rake"    , "~> 12.3"
  spec.add_development_dependency "rspec"   , "~> 3.0"
  spec.add_development_dependency "pry-meta", "~> 0.0"
end
