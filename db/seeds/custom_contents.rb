# frozen_string_literal: true

#  Copyright (c) 2021, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

CustomContent.seed_once(:key,
  {
    key: Event::ParticipationMailer::CONTENT_CAMP_CONFIRMATION,
    placeholders_required: 'camp-name',
    placeholders_optional: %w(
      participant-first-name
      participant-last-name
      participant-birthday
      participant-gender
      participant-street
      participant-zipcode
      participant-town
    ).join(', ')
  },
  {
    key: Event::ParticipationMailer::CONTENT_WAITING_LIST,
    placeholders_required: 'camp-name',
    placeholders_optional: ''
  }
)

camp_application_confirmation = CustomContent.get(Event::ParticipationMailer::CONTENT_CAMP_CONFIRMATION).id
application_waiting_list = CustomContent.get(Event::ParticipationMailer::CONTENT_WAITING_LIST).id

CustomContent::Translation.seed_once(:custom_content_id, :locale,
  { custom_content_id: camp_application_confirmation,
    locale: 'de',
    label: 'Lager: E-Mail Anmeldebestätigung',
    subject: "Ihre Lageranmeldung: {camp-name}",
    body: <<~HTML },
      <p>
        Vielen Dank für Ihre Anmeldung. Die Anmeldungen werden in der Reihenfolge ihres
        Eingangs berücksichtigt. Eine Teilnahmebestätigung erhalten Sie kurz nach der
        Anmeldung, damit Sie auch die Reise in die Schweiz planen können. Alle weiteren
        Informationen zum Lager erhalten Sie in 3 Monaten. Wir empfehlen Ihnen
        untenstehenden Text auszudrucken und als Bestätigung Ihrer Anmeldung
        aufzubewahren.
      </p>

      <b>Angaben zum Kind</b>

      <ul>
        <li>Vorname: {participant-first-name}</li>
        <li>Name: {participant-last-name}</li>
        <li>Geburtstag: {participant-birthday}</li>
        <li>Geschlecht: {participant-gender}</li>
        <li>Strasse: {participant-street}</li>
        <li>Postleitzahl: {participant-zipcode}</li>
        <li>Ort: {participant-town}</li>
      </ul>
    HTML

  { custom_content_id: application_waiting_list,
    locale: 'de',
    label: 'Lager: E-Mail Warteliste',
    subject: "Ihre Lageranmeldung: {camp-name} (WARTELISTE)",
    body: <<~HTML },
      <p>
        Vielen Dank für Ihre Anmeldung. Die Anmeldungen werden in der Reihenfolge ihres
        Eingangs berücksichtigt.
      </p>
      <p>
        Leider sind aktuell alle Plätze belegt, <b>die Anmeldung ist daher vorerst
        auf der Warteliste</b>.
      </p>
    HTML
 )

