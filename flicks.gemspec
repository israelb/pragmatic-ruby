# -*- encoding: utf-8 -*-
 
Gem::Specification.new do |gem|
  gem.authors       = ["Israel Barba"]
  gem.email         = ["israelb.aceves@gmail.com"]
  gem.description   = "Reviews of movies"
  gem.summary       = "Plays a reviews movies"
  gem.homepage      = ""
 
  gem.executables   = [ 'flicks' ]
  gem.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  gem.test_files    = Dir["spec/**/*"]
  gem.name          = "flicks"
  gem.version       = "1.0.0"

  gem.required_ruby_version = '>=1.9'
  gem.add_development_dependency 'rspec'  
  gem.add_dependency 'colorize'
end