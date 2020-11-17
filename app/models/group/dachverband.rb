# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


# SJAS
class Group::Dachverband < ::Group
  self.layer = true
  self.event_types = [Event, Event::Camp]

  self.default_children = [
    Group::DachverbandGeschaeftsstelle,
    Group::DachverbandLeitungspool,
    Group::DachverbandTeilnehmerpool,
    Group::DachverbandStiftungsrat
  ]

  children Group::DachverbandGeschaeftsstelle,
           Group::DachverbandLeitungspool,
           Group::DachverbandTeilnehmerpool,
           Group::DachverbandStiftungsrat,
           Group::Stiftung,
           Group::Partner,
           Group::Kantonalkomitee,
           Group::Fundraising

  class Admin < ::Role::Admin
    self.permissions += [:impersonation]
  end

  roles Admin
end
