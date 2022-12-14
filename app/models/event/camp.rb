# frozen_string_literal: true

#  Copyright (c) 2020-2021, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

class Event::Camp < Event
  self.used_attributes += [:waiting_list]
  self.used_attributes -= [:motto]

  def tentative_application_possible?
    false
  end
end
