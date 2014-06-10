$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'model_discovery/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'model_discovery'
  s.version     = ModelDiscovery::VERSION
  s.authors     = ['Sameer Rahmani']
  s.email       = ['lxsameer@gnu.org']
  s.homepage    = 'https://github.com/Yellowen/model_discovery'
  s.licenses = ['GPL-2']
  s.summary     = 'A fast solution to model detection in Ruby on Rails.'
  s.description = 'Detecting all models in a rails application (even those in gems) without loading them at runtime is a troublesome task with model_discovery done.'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'railties', '~> 4.0.2'
  s.add_dependency 'orm_adapter'

  #s.add_development_dependency 'sqlite3'
end
