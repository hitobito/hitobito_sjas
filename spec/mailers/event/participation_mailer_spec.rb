# frozen_string_literal: true

#  Copyright (c) 2025-2026, Stiftung für junge Auslandschweizer. This file is part of
# #  hitobito_sjas and licensed under the Affero General Public License version 3
# #  or later. See the COPYING file at the top-level directory or at
# #  https://github.com/hitobito/hitobito_sjas.

require "spec_helper"

describe Event::ParticipationMailer do
  let(:person) { people(:leader) }
  let(:participation) { Fabricate(:event_participation, event: event, participant: person) }

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

  context "in event" do
    let(:event) { Fabricate(:event) }

    before do
      SeedFu.quiet = true
      SeedFu.seed [Rails.root.join("db", "seeds")]
    end

    it "contains the application answers" do
      question = event.questions.create!(question: "Shoe size?", required: false)
      participation.answers.find_or_initialize_by(question:).update!(answer: "42")

      mail = Event::ParticipationMailer.confirmation(participation)
      expect(mail.parts.first.body).to include("Shoe size?: 42")
    end
  end
end
