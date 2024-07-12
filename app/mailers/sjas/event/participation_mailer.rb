# frozen_string_literal: true

#  Copyright (c) 2021, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::Event::ParticipationMailer
  CONTENT_CAMP_CONFIRMATION = "event_application_camp_confirmation"
  CONTENT_WAITING_LIST = "event_application_waiting_list"

  def confirmation(participation)
    @participation = participation

    filename = Export::Pdf::Participation.filename(participation)
    attachments[filename] = Export::Pdf::Participation.render(participation)

    content = if participation.event.is_a?(Event::Camp)
      CONTENT_CAMP_CONFIRMATION
    else
      ::Event::ParticipationMailer::CONTENT_CONFIRMATION
    end

    compose(person, content)
  end

  def waiting_list(participation)
    @participation = participation

    compose(person, CONTENT_WAITING_LIST)
  end

  private

  def placeholder_camp_name
    event.name
  end

  def placeholder_participant_first_name
    person.first_name
  end

  def placeholder_participant_last_name
    person.last_name
  end

  def placeholder_participant_birthday
    localize(person.birthday)
  end

  def placeholder_participant_gender
    person.gender_label
  end

  def placeholder_participant_street
    person.address
  end

  def placeholder_participant_zipcode
    person.zip_code
  end

  def placeholder_participant_town
    person.town
  end
end
