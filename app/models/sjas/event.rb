# frozen_string_literal: true

#  Copyright (c) 2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas
  module Event
    extend ActiveSupport::Concern

    included do
      [
        ::Event::Role::Helper,
        ::Event::Role::Treasurer,
        ::Event::Role::Speaker
      ].each do |type|
        disable_role_type(type)
      end

      [
        ::Event::Role::AssistantLeaderZivildienst,
        ::Event::Role::CookZivildienst,
        ::Event::Role::LeaderZivildienst,
        ::Event::Role::ParticipantZivildienst
      ].each do |type|
        register_role_type(type)
      end
    end
  end
end
