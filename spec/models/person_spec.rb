# frozen_string_literal: true

#  Copyright (c) 2012-2022, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


require 'spec_helper'

describe Person do

  context 'implemented through youth wagon' do
    it 'contains js number, nationality js and ahv number' do
      expect(described_class.column_names).to include('j_s_number')
      expect(described_class.column_names).to include('nationality_j_s')
    end
  end

end
