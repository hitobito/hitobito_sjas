$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your wagon's version:
require 'hitobito_sjas/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # rubocop:disable SingleSpaceBeforeFirstArg
  s.name        = 'hitobito_sjas'
  s.version     = HitobitoSjas::VERSION
  s.authors     = ['Your name']
  s.email       = ['Your email']
  # s.homepage    = 'TODO'
  s.summary     = 'Sjas'
  s.description = 'Wagon description'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile']
  s.test_files = Dir['test/**/*']
  # rubocop:enable SingleSpaceBeforeFirstArg
end
