# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/figures/version"

Gem::Specification.new do |gem|
  gem.name          = "figures"
  gem.version       = Figures::VERSION
  gem.summary       = "German number words"
  gem.description   = "German number words."
  gem.authors       = ["Paul Götze", "Jan Lelis"]
  gem.email         = "paul.christoph.goetze@gmail.com"
  gem.homepage      = "https://github.com/paulgoetze/figures"
  gem.license       = "MIT"

  gem.files         = Dir['{**/}{.*,*}'].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.0'
end
