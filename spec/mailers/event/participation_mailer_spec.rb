# frozen_string_literal: true

#  Copyright (c) 2025, Stiftung für junge Auslandschweizer. This file is part of
# #  hitobito_sjas and licensed under the Affero General Public License version 3
# #  or later. See the COPYING file at the top-level directory or at
# #  https://github.com/hitobito/hitobito_sjas.

require "spec_helper"

describe Event::ParticipationMailer do
  let(:person) { people(:leader) }
  let(:participation) { Fabricate(:event_participation, event: event, person: person) }

  context "in camp" do
    let(:event) { events(:top_camp) }

    before do
      SeedFu.quiet = true
      SeedFu.seed [HitobitoSjas::Wagon.root.join('db', 'seeds')]
    end

    it "handles nil birthday" do
      person.update(birthday: nil)
      mail = Event::ParticipationMailer.confirmation(participation)
      expect { mail.parts.first.body }.not_to raise_error
    end
  end
end
