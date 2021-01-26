# frozen_string_literal: true

#  Copyright (c) 2012-2021, Stiftung für junge Auslandschweizer. This file is part of
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
      expect(camp_groups).to match_array [Group::Dachverband]
      # Remark: if you enable camps for more group types than the
      # root, please extend the GroupAbility and EventAbility specs
    end
  end

  context 'name' do
    it 'is not translated for german locale' do
      group = groups(:teilnehmerpool)

      with_locale(:de) do
        expect(group.name).to be == 'Teilnehmende'
      end
    end

    it 'is replaced by translated type-name if unique' do
      group = groups(:root)

      expect(Group.where(type: group.type)).to be_one

      with_locale(:en) do
        expect(group.name).to be == 'Foundation for Young Swiss Abroad'
      end
    end

    it 'is not translated if not unique' do
      group = groups(:partner)
      expect(Group.where(type: group.type)).to_not be_one

      with_locale(:en) do
        expect(group.name).to be == group.read_attribute(:name)
      end
    end

    it 'fetches translation from "name"' do
      group = groups(:root)

      expect(Group.where(type: group.type)).to be_one

      with_locale(:en) do
        expect(I18n.t('activerecord.models.group/dachverband.name')).to be == 'Foundation for Young Swiss Abroad'
        expect(group.name).to be == 'Foundation for Young Swiss Abroad'
        expect(group.name).to be == I18n.t('activerecord.models.group/dachverband.name')
      end
    end

    it 'fetches translation from "one" if "name" is unavailable' do
      group = groups(:geschaeftsstelle)

      expect(Group.where(type: group.type)).to be_one

      with_locale(:en) do
        expect(I18n.t('activerecord.models.group/dachverband_geschaeftsstelle.name', default: nil)).to be_nil
        expect(I18n.t('activerecord.models.group/dachverband_geschaeftsstelle.one')).to be == 'Office'
        expect(group.name).to be == 'Office'
        expect(group.name).to be == I18n.t('activerecord.models.group/dachverband_geschaeftsstelle.one')
      end
    end
  end

  def with_locale(loc)
    prev = I18n.locale
    I18n.locale = loc
    yield
  ensure
    I18n.locale = prev
  end
end
