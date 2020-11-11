# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


# require Rails.root.join('db', 'seeds', 'support', 'group_seeder')
# seeder = GroupSeeder.new
# srand(42)

root = Group.root

# setup some more groups layers
Group::Stiftung.seed_once(:name, parent_id: root.id, name: "Stiftung für Kinder")
Group::Stiftung.seed_once(:name, parent_id: root.id, name: "Stiftung für Schweizer")
Group::Partner.seed_once(:name, parent_id: root.id, name: "PBS")
Group::Partner.seed_once(:name, parent_id: root.id, name: "ASO")
Group::Partner.seed_once(:name, parent_id: root.id, name: "EDA")
Group::Kantonalkomitee.seed_once(:name, parent_id: root.id, name: "AG/SO")
Group::Kantonalkomitee.seed_once(:name, parent_id: root.id, name: "GR")
Group::Kantonalkomitee.seed_once(:name, parent_id: root.id, name: "ZG")
Group::Fundraising.seed_once(:name, parent_id: root.id, name: "Institutionen/Stiftungen", short_name: 'Institutionen')
Group::Fundraising.seed_once(:name, parent_id: root.id, name: "Privatspender")

puts "Rebuilding Nested Set..."
Group.rebuild!
