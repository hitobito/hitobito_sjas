# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


require 'spec_helper'

describe Event::ParticipationContactData do

  let(:event) { events(:top_event) }
  let(:person) { people(:leader) }
  let(:attributes) do
    ActiveSupport::HashWithIndifferentAccess.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'john_doe@example.com',
      place_of_origin: ''
    )
  end

  context :place_of_origin do
    it 'validates mandatory place of origin' do
      contact_data = participation_contact_data(attributes)
      event.update!(required_contact_attrs: ['place_of_origin'])

      expect(contact_data).not_to be_valid
      expect(contact_data.errors.details).to eq(place_of_origin: [error: 'muss ausgefüllt werden'])
    end

    it 'allows blank value for optional place of origin' do
      contact_data = participation_contact_data(attributes)

      expect(contact_data).to be_valid
    end

    it 'updates place of origin' do
      attributes[:place_of_origin] = 'Trubschachen BE'
      contact_data = participation_contact_data(attributes)
      contact_data.save

      person.reload
      expect(person.reload.place_of_origin).to eq('Trubschachen BE')
    end
  end

  def participation_contact_data(attributes)
    Event::ParticipationContactData.new(event, person, attributes)
  end

end
