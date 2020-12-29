# frozen_string_literal: true

#  Copyright (c) 2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

describe Event::Camp do
  subject(:camp) { described_class.new }
  subject(:camp_without_waiting_list) { described_class.new(waiting_list: false) }

  it 'can have a waiting-list, generally' do
    expect(described_class.supports_applications).to be true
    expect(described_class).to be_attr_used(:waiting_list)
  end

  it 'does have an activated waiting-list by default' do
    expect(camp).to be_waiting_list_available
  end

  it 'can deactivate the waiting-list' do
    expect(camp_without_waiting_list).to_not be_waiting_list_available
  end
end
