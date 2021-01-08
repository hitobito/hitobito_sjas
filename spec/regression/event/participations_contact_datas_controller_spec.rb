# frozen_string_literal: true

#  Copyright (c) 2012-2021, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

require 'spec_helper'

describe Event::ParticipationContactDatasController, type: :controller do

  render_views

  let(:group) { groups(:root) }
  let(:event) { Fabricate(:event, groups: [group]) }
  let(:person) { people(:leader) }
  let(:dom) { Capybara::Node::Simple.new(response.body) }

  before { sign_in(person) }

  describe 'GET edit' do
    it 'does not show hidden place of origin field' do
      event.update!({ hidden_contact_attrs: ['place_of_origin'] })

      get :edit,
        params: {
          group_id: event.groups.first.id,
          event_id: event.id,
          event_role: { type: 'Event::Role::Participant' }
        }

      expect(dom).to have_no_selector('input#event_participation_contact_data_place_of_origin')
    end

    it 'shows place of origin field by default' do
      get :edit,
        params: {
          group_id: event.groups.first.id,
          event_id: event.id,
          event_role: { type: 'Event::Role::Participant' }
        }

      expect(dom).to have_selector('input#event_participation_contact_data_place_of_origin')
    end
  end

  describe 'POST update' do
    before do
      event.update!({ required_contact_attrs: ['place_of_origin']})
    end

    it 'validates place of origin attribute' do
      contact_data_params = {
        first_name: 'John',
        last_name: 'Doe',
        email: 'john.doe@example.com',
        place_of_origin: ''
      }

      post :update,
        params: {
          group_id: group.id,
          event_id: event.id,
          event_participation_contact_data: contact_data_params,
          event_role: { type: 'Event::Role::Participant' }
        }

      is_expected.to render_template(:edit)

      expect(dom).to have_selector('.alert-error li', text: 'Heimatort/Kanton muss ausgefüllt werden')
    end

    it 'updates place of origin attribute and redirects to event questions' do
      contact_data_params = {
        first_name: 'John',
        last_name: 'Doe',
        email: 'john.doe@example.com',
        place_of_origin: 'Trubschachen BE'
      }

      post :update,
        params: {
          group_id: group.id,
          event_id: event.id,
          event_participation_contact_data: contact_data_params,
          event_role: { type: 'Event::Role::Participant' }
        }

      is_expected.to redirect_to new_group_event_participation_path(
        group,
        event,
        event_role: { type: 'Event::Role::Participant' }
      )

      person.reload
      expect(person.place_of_origin).to eq('Trubschachen BE')
    end
  end

end
