# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

require 'spec_helper'

describe Event::ListsController do

  render_views

  let(:user) { people(:admin) }

  before { sign_in(user) }

  context 'GET #camps' do
    it 'populates camps by start_at' do
      camp1 = Fabricate(:camp)
      camp1.dates.create(start_at: 1.year.from_now, finish_at: 1.year.from_now + 5.days)

      camp2 = Fabricate(:camp)
      camp2.dates.create(start_at: 1.day.from_now, finish_at: 5.days.from_now)

      camp3 = Fabricate(:camp)
      camp3.dates.create(start_at: 1.year.ago, finish_at: 1.year.ago + 5.days)

      get :camps

      # Hint: We do not test group hierarchy order here, since camps
      # are only possible within root group
      expect(assigns(:grouped_events).values).to eq([[camp2], [camp1]])
    end

    it 'does not include events' do
      create_event(:root)

      get :camps

      expect(assigns(:grouped_events)).to be_empty
    end

    it 'groups by month' do
      create_event(:root, type: :camp, start_at: Time.zone.parse('2020-10-30'))
      create_event(:root, type: :camp, start_at: Time.zone.parse('2020-11-1'))

      get :camps

      expect(assigns(:grouped_events).keys).to eq(['Oktober 2020', 'November 2020'])
    end
  end

  def create_event(group, hash = {})
    hash = { start_at: 4.days.ago, finish_at: 1.day.from_now, type: :event }.merge(hash)
    event = Fabricate(hash[:type], groups: [groups(group)])
    event.dates.create(start_at: hash[:start_at], finish_at: hash[:finish_at])
    event
  end
end
