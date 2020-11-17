# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class SjasPersonSeeder < PersonSeeder

  def amount(role_type)
    case role_type.name.demodulize
    when 'Admin' then 2
    when 'Kontakt', 'Partner' then 5
    when 'Teilnehmer' then 20
    when /(Lager|Kurs|Mit)leitung$/, 'Koch', 'Zivildienstleistender' then 2
    when 'Beisitzer' then 3
    else
      case role_type.name.split('::')[1]
      when 'DachverbandGeschaeftsstelle' then 2
      when 'DachverbandStiftungsrat' then 1
      else
        1
      end
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

devs = {}
puzzlers.each do |puz|
  devs[puz] = "#{puz.split.last.downcase}@puzzle.ch"
end

seeder = SjasPersonSeeder.new

seeder.seed_all_roles

root = Group.root
devs.each do |name, email|
  seeder.seed_developer(name, email, root, Group::Dachverband::Admin)
end

geschaeftsstelle = Group::DachverbandGeschaeftsstelle.first
[
  seeder.seed_developer('Loïc Roth', 'roth@sjas.ch', geschaeftsstelle,
                        Group::DachverbandGeschaeftsstelle::Geschaeftsfuehrung),
  seeder.seed_developer('Sibylle Kappeler', 'kappeler@sjas.ch', geschaeftsstelle,
                        Group::DachverbandGeschaeftsstelle::Projektleitung),
  seeder.seed_developer('Elena Tarozzo', 'tarozzo@sjas.ch', geschaeftsstelle,
                        Group::DachverbandGeschaeftsstelle::Sachbearbeitung),
].map do |roles|
  primary_role = Array(roles).first
  seeder.seed_role(primary_role.person, root, Group::Dachverband::Admin) if primary_role
end
