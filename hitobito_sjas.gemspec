$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your wagon's version:
require 'hitobito_sjas/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # rubocop:disable SingleSpaceBeforeFirstArg
  s.name        = 'hitobito_sjas'
  s.version     = HitobitoSjas::VERSION
  s.authors     = ['Matthias Viehweger', 'Mathis Hofer']
  s.email       = ['viehweger@puzzle.ch', 'hofer@puzzle.ch']
  # s.homepage    = 'TODO'
  s.summary     = 'Hitobito SJAS Wagon'
  s.description = 'Hitobito Wagon for "Stiftung f. junge Auslandssschweizer"'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile']
  s.test_files = Dir['test/**/*']
  # rubocop:enable SingleSpaceBeforeFirstArg
end
