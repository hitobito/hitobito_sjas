# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

class AddLangagesToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :language_skill_de, :string, default: nil, limit: 6
    add_column :people, :language_skill_fr, :string, default: nil, limit: 6
    add_column :people, :language_skill_it, :string, default: nil, limit: 6
    add_column :people, :language_skill_en, :string, default: nil, limit: 6
    add_column :people, :language_skill_es, :string, default: nil, limit: 6
    add_column :people, :other_native_language, :string, default: nil, limit: 30
  end
end
