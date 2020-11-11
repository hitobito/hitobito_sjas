# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

require 'spec_helper'

describe PeopleController do

  render_views

  let(:user) { people(:admin) }

  before { sign_in(user) }

  describe 'PUT update' do
    it 'updates the SJAS attrs' do
      params = {
        id: user.id,
        group_id: groups(:root).id,
        person: {
          first_name: 'updated_name',
          place_of_origin: 'Trubschachen BE',
          language_skill_de: 'native',
          language_skill_fr: 'good',
          language_skill_it: 'none',
          language_skill_en: 'good',
          language_skill_es: 'basic',
          other_native_language: 'Klingonisch'
        }
      }

      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.first_name).to eq('updated_name')
      expect(user.place_of_origin).to eq('Trubschachen BE')
      expect(user.language_skill_de).to eq('native')
      expect(user.language_skill_fr).to eq('good')
      expect(user.language_skill_it).to eq('none')
      expect(user.language_skill_en).to eq('good')
      expect(user.language_skill_es).to eq('basic')
      expect(user.other_native_language).to eq('Klingonisch')
    end
  end
end
