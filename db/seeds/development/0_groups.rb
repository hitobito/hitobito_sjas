# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


root = Group.root

Group::Kantonalkomitee.seed_once(:name, parent_id: root.id, name: 'Aargau und Solothurn', short_name: 'AG/SO')
Group::Kantonalkomitee.seed_once(:name, parent_id: root.id, name: 'Graubünden',           short_name: 'GR')
Group::Kantonalkomitee.seed_once(:name, parent_id: root.id, name: 'Zug',                  short_name: 'ZG')
Group::Kantonalkomitee.seed_once(:name, parent_id: root.id, name: 'Stiftungen')

externe = Group::DachverbandExterne.where(parent_id: root.id, name: 'Externe').first

Group::DachverbandExterne.seed_once(:name,  parent_id: externe.id, name: 'Partner')
Group::DachverbandExterne.seed_once(:name,  parent_id: externe.id, name: 'Dienstleister')
Group::DachverbandExterne.seed_once(:name,  parent_id: externe.id, name: 'Institutionen')
Group::DachverbandExterne.seed_once(:name,  parent_id: externe.id, name: 'Privatpersonen')
Group::DachverbandStiftung.seed_once(:name, parent_id: externe.id, name: 'Stiftungen')


puts 'Rebuilding Nested Set...'
Group.rebuild!
