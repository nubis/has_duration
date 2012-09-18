$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "has_duration/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "has_duration"
  s.version     = HasDuration::VERSION
  s.authors     = ["nubis"]
  s.email       = ["nubis@woobiz.com.ar"]
  s.homepage    = "http://github.com/nubis/has_duration"
  s.summary     = "Extends ActiveRecord to let you store time durations like '1.month' or '10.years'"
  s.description = "Extends ActiveRecord to let you store time durations like '1.month' or '10.years'.
It does it by providing a serializer and validator for ActiveSupport::Duration objects.
"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2"

  s.add_development_dependency "sqlite3"
end
