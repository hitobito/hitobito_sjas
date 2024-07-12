# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module PeopleSjasHelper
  PERSON_I18N_KEY_PREFIX = "activerecord.attributes.person"

  def possible_person_language_skills
    Sjas::Person::LANGUAGE_SKILLS.map do |key|
      [key, t("#{PERSON_I18N_KEY_PREFIX}.language_skills.#{key}")]
    end
  end

  def format_person_language_skill_de(person)
    format_person_language_skill(person.language_skill_de)
  end

  def format_person_language_skill_fr(person)
    format_person_language_skill(person.language_skill_fr)
  end

  def format_person_language_skill_it(person)
    format_person_language_skill(person.language_skill_it)
  end

  def format_person_language_skill_en(person)
    format_person_language_skill(person.language_skill_en)
  end

  def format_person_language_skill_es(person)
    format_person_language_skill(person.language_skill_es)
  end

  def format_person_language_skill(skill)
    if skill.present?
      t("#{PERSON_I18N_KEY_PREFIX}.language_skills.#{skill}")
    end
  end
end
