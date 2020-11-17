# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


require 'spec_helper'

describe Group do

  include_examples 'group types'

  context Event::Course do
    it 'is not enabled for any group type' do
      course_groups = Group.all_types.select { |g| g.event_types.include?(Event::Course) }
      expect(course_groups).to eq([])
    end
  end

  context Event::Camp do
    it 'is only enabled for root group type' do
      camp_groups = Group.all_types.select { |g| g.event_types.include?(Event::Camp) }
      expect(camp_groups).to match_array(Group::Dachverband)
      # Remark: if you enable camps for more group types than the
      # root, please extend the GroupAbility and EventAbility specs
    end
  end

end
