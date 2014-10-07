$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_remarks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_remarks"
  s.version     = UserRemarks::VERSION
  s.authors     = ["Grzegorz Brzezinka"]
  s.email       = ["grzegorz@brzezinka.eu"]
  s.homepage    = "https://github.com/matfiz/user_remarks"
  s.summary     = "TODO: Summary of UserRemarks."
  s.description = "TODO: Description of UserRemarks."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0.beta2"

  s.add_development_dependency "sqlite3"
end
