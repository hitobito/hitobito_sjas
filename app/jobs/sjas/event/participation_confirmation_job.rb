# frozen_string_literal: true

#  Copyright (c) 2021, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::Event::ParticipationConfirmationJob
  def send_confirmation
    return unless participation.person.valid_email?

    if participation.waiting_list?
      Event::ParticipationMailer.waiting_list(participation).deliver_now
    else
      Event::ParticipationMailer.confirmation(participation).deliver_now
    end
  end
end
