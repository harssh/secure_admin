$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "secure_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "secure_admin"
  s.version     = SecureAdmin::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SecureAdmin."
  s.description = "TODO: Description of SecureAdmin."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "devise"

  s.add_development_dependency "sqlite3"
end
