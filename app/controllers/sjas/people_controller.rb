# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::PeopleController
  extend ActiveSupport::Concern

  included do
    self.permitted_attrs += [
      :place_of_origin, :language_skill_de, :language_skill_fr, :language_skill_it,
      :language_skill_en, :language_skill_es, :other_native_language, :bank_account, 
      :insurance_company, :insurance_number
    ]
  end
end
