# frozen_string_literal: true

#  Copyright (c) 2012-2021, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


require Rails.root.join('db', 'seeds', 'support', 'event_seeder')

srand(42)

class SjasEventSeeder < EventSeeder

  def seed_event(group_id, type)
    values = event_values(group_id)
    case type
      when :course then seed_course(values)
      when :camp then seed_camp(values)
      when :base then seed_base_event(values)
    end
  end

  def seed_camp(values)
    date, number = values[:application_opening_at], values[:number]
    event = Event::Camp.find_or_initialize_by(name: "Lager #{number}")
    event.attributes = values
    event.save(validate: false)

    seed_dates(event, date + 90.days)
    seed_questions(event) if true?
    seed_leaders(event)
    3.times do
      event.participant_types.each do |type|
        seed_event_role(event, type)
      end
    end
  end

end

seeder = SjasEventSeeder.new

layer_types = Group.all_types.select(&:layer).collect(&:sti_name)
Group.where(type: layer_types).pluck(:id).each do |group_id|
  5.times do
    seeder.seed_event(group_id, :base)
  end
end

5.times do
  seeder.seed_event(Group.root.id, :camp)
end
