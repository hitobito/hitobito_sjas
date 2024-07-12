# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::Person
  extend ActiveSupport::Concern

  LANGUAGE_SKILLS = %w[native good basic none].freeze

  included do
    include I18nEnums

    Person::PUBLIC_ATTRS << :language_skill_de << :language_skill_fr << :language_skill_it <<
      :language_skill_en << :language_skill_es << :other_native_language

    i18n_enum :language_skill_de, LANGUAGE_SKILLS
    i18n_enum :language_skill_fr, LANGUAGE_SKILLS
    i18n_enum :language_skill_it, LANGUAGE_SKILLS
    i18n_enum :language_skill_en, LANGUAGE_SKILLS
    i18n_enum :language_skill_es, LANGUAGE_SKILLS
  end
end
