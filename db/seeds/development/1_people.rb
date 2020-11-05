# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class SjasPersonSeeder < PersonSeeder

  def amount(role_type)
    case role_type.name.demodulize
    when 'Member' then 5
    else 1
    end
  end

end

puzzlers = [
  'Andreas Maierhofer',
  'Mathis Hofer',
  'Matthias Viehweger',
  'Olivier Brian',
  'Pascal Simon',
  'Pascal Zumkehr',
]

devs = { 'Loïc Roth' => 'roth@sjas.ch' }
puzzlers.each do |puz|
  devs[puz] = "#{puz.split.last.downcase}@puzzle.ch"
end

seeder = SjasPersonSeeder.new

seeder.seed_all_roles

root = Group.root
devs.each do |name, email|
  seeder.seed_developer(name, email, root, Group::Dachverband::Admin)
end
