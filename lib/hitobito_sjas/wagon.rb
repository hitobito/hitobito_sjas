# frozen_string_literal: true

#  Copyright (c) 2012-2022, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


module HitobitoSjas
  class Wagon < Rails::Engine
    include Wagons::Wagon

    # Set the required application version.
    app_requirement '>= 0'

    # Add a load path for this specific wagon
    config.autoload_paths += %W[
      #{config.root}/app/abilities
      #{config.root}/app/domain
      #{config.root}/app/jobs
    ]

    config.to_prepare do
      # extend application classes here

      # Models
      Group.prepend Sjas::Group
      Event.include Sjas::Event
      Event::Course.include Sjas::Event::Course
      Event::ParticipationContactData.include Sjas::Event::ParticipationContactData
      Person.include Sjas::Person

      # Abilities
      GroupAbility.include Sjas::GroupAbility
      EventAbility.abilities[Event::Camp] =
        EventAbility.abilities[Event] # Camp has same abilities as event

      # Decorators
      EventDecorator.icons['Event::Camp'] = :campground

      # Controllers
      PeopleController.include Sjas::PeopleController
      Event::ListsController.prepend Sjas::Event::ListsController
      Event::ApplicationMarketController.prepend Sjas::Event::ApplicationMarketController

      # Sheets
      Sheet::Group.include Sjas::Sheet::Group
      Sheet::Event::List.include Sjas::Sheet::Event::List

      # Mailers
      Event::ParticipationMailer.prepend Sjas::Event::ParticipationMailer

      # Jobs
      Event::ParticipationConfirmationJob.prepend Sjas::Event::ParticipationConfirmationJob

      # Main navigation
      index_courses = NavigationHelper::MAIN.index { |opts| opts[:label] == :courses }
      NavigationHelper::MAIN.insert(
        index_courses + 1,
        label: :camps,
        icon_name: :campground,
        url: :list_camps_path,
        active_for: %w(list_camps),
        if: ->(_) { can?(:list_available, Event::Camp) }
      )
    end

    initializer 'sjas.add_settings' do |_app|
      Settings.add_source!(File.join(paths['config'].existent, 'settings.yml'))
      Settings.reload!
    end

    initializer 'sjas.add_inflections' do |_app|
      ActiveSupport::Inflector.inflections do |inflect|
        # inflect.irregular 'census', 'censuses'
      end
    end

    private

    def seed_fixtures
      fixtures = root.join('db', 'seeds')
      ENV['NO_ENV'] ? [fixtures] : [fixtures, File.join(fixtures, Rails.env)]
    end

  end
end
