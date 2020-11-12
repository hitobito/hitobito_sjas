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
    let(:params) do
      {
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
    end

    it 'updates the first name' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.first_name).to eq('updated_name')
    end

    it 'updates the place of origin' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.place_of_origin).to eq('Trubschachen BE')
    end

    it 'updates the german language skills' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.language_skill_de).to eq('native')
    end

    it 'updates the french language skills' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.language_skill_fr).to eq('good')
    end

    it 'updates the italian language skills' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.language_skill_it).to eq('none')
    end

    it 'updates the english language skills' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.language_skill_en).to eq('good')
    end

    it 'updates the spanish language skills' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.language_skill_es).to eq('basic')
    end

    it 'updates the other native language' do
      patch :update, params: params

      user.reload

      expect(response).to have_http_status(302)
      expect(user.other_native_language).to eq('Klingonisch')
    end
  end
end
