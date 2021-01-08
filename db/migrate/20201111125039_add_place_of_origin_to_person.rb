# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

class AddPlaceOfOriginToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :place_of_origin, :string, default: nil
  end
end
