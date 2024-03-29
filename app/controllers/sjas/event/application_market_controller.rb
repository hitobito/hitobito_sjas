# frozen_string_literal: true

#  Copyright (c) 2022-2022, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas
  module Event::ApplicationMarketController
    def load_applications
      super.where.not(id: load_participants.pluck(:id))
    end
  end
end
