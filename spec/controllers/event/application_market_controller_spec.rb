# frozen_string_literal: true

#  Copyright (c) 2022-2022, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

require 'spec_helper'

describe Event::ApplicationMarketController do
  let(:event) { Fabricate(:camp) }
  let(:other_camp) { Fabricate(:camp) }
  let(:group) { event.groups.first }

  let!(:participation) do
    p = Fabricate(:event_participation,
                  event: event,
                  active: true,
                  application: Fabricate(:event_application, priority_1: event, priority_2: nil))
    Fabricate(Event::Camp::Role::Participant.name.to_sym, participation: p)
    p.reload
  end

  let!(:application_prio_one) do
    Fabricate(:event_participation,
                  active: false,
                  application: Fabricate(:event_application, waiting_list: true, priority_1: event, priority_2: nil),
                  event: event)
  end

  let!(:participation_other) do
    p = Fabricate(:event_participation,
                  active: false,
                  event: other_camp,
                  application: Fabricate(:event_application, priority_1: other_camp, priority_2: nil))
    Fabricate(Event::Camp::Role::Participant.name.to_sym, participation: p)
    p.reload
  end

  before { sign_in(people(:admin)) }

  describe 'GET index' do
    context 'with standard filter' do
      before { get :index, params: { group_id: group.id, event_id: event.id } }

      context 'participants' do
        subject { assigns(:participants) }

        it { is_expected.to have(1).item }

        it { is_expected.to include(participation) }
        it { is_expected.not_to include(application_prio_one) }
        it { is_expected.not_to include(participation_other) }
      end

      context 'applications' do
        subject { assigns(:applications) }

        it { is_expected.to have(1).item }

        it { is_expected.to_not include(participation) }
        it { is_expected.to include(application_prio_one) }
        it { is_expected.not_to include(participation_other) }
      end
    end
  end
end
