# frozen_string_literal: true

load File.expand_path("app_root.rb", __dir__)

source "https://rubygems.org"

# Declare your gem's dependencies in hitobito_sjas.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Load application Gemfile for all application dependencies.
eval File.read(File.expand_path("Gemfile", ENV["APP_ROOT"])) # rubocop:disable Security/Eval

group :development, :test do
  # Explicitly define the path for dependencies on other wagons.
  gem "hitobito_youth", path: "#{ENV["APP_ROOT"]}/../"
end
