# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::Sheet::Group
  extend ActiveSupport::Concern

  included do
    tabs.insert(4,
      Sheet::Tab.new("activerecord.models.event/camp.other",
        :camp_group_events_path,
        params: {returning: true},
        if: lambda do |view, group|
          group.event_types.include?(::Event::Camp) &&
            view.can?(:"index_event/camps", group)
        end))
  end
end
