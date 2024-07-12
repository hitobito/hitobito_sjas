# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your wagon's version:
require "hitobito_sjas/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "hitobito_sjas"
  s.version = HitobitoSjas::VERSION
  s.authors = ["Matthias Viehweger", "Mathis Hofer"]
  s.email = ["viehweger@puzzle.ch", "hofer@puzzle.ch"]
  # s.homepage    = 'TODO'
  s.summary = "Hitobito SJAS Wagon"
  s.description = 'Hitobito Wagon for "Stiftung für junge Auslandschweizer"'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]

  s.required_ruby_version = ">= 2.5.5"

  s.add_dependency "hitobito_youth"
end
