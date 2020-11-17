# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

require 'spec_helper'

describe EventAbility do

  subject { ability }
  let(:ability) { Ability.new(role.person.reload) }

  context Event::Camp do
    context 'layer and below full' do
      let(:role) { Fabricate(Group::DachverbandGeschaeftsstelle::Adressverwalter.name.to_sym, group: groups(:geschaeftsstelle)) }

      context 'in same layer' do
        let(:group) { groups(:root) }

        it 'may show camp' do
          is_expected.to be_able_to(:show, events(:top_camp))
        end

        it 'may create camp' do
          camp = Fabricate.build(:camp, groups: [group])
          is_expected.to be_able_to(:create, camp)
        end

        it 'may update camp' do
          is_expected.to be_able_to(:update, events(:top_camp))
        end

        it 'may index participants for camp' do
          camp = Fabricate(:event, groups: [group])
          is_expected.to be_able_to(:index_participations, camp)
        end
      end
    end

    context 'layer read' do
      let(:role) { Fabricate(Group::DachverbandStiftungsrat::Praesident.name.to_sym, group: groups(:stiftungsrat)) }

      context 'in same layer' do
        let(:group) { groups(:root) }

        it 'may show camp' do
          is_expected.to be_able_to(:show, events(:top_camp))
        end

        it 'may not create camp' do
          camp = Fabricate.build(:camp, groups: [group])
          is_expected.not_to be_able_to(:create, camp)
        end

        it 'may not update camp' do
          is_expected.not_to be_able_to(:update, events(:top_camp))
        end

        it 'may not index participants for camp' do
          camp = Fabricate(:event, groups: [group])
          is_expected.not_to be_able_to(:index_participations, camp)
        end
      end
    end

    context 'group full' do
      let(:role) { Fabricate(Group::Kantonalkomitee::Adressverwalter.name.to_sym, group: groups(:ag_so)) }

      context 'in other group from other layer' do
        let(:group) { groups(:root) }

        it 'may show camp' do
          is_expected.to be_able_to(:show, events(:top_camp))
        end

        it 'may not create camp' do
          camp = Fabricate.build(:camp, groups: [group])
          is_expected.not_to be_able_to(:create, camp)
        end

        it 'may not update camp' do
          is_expected.not_to be_able_to(:update, events(:top_camp))
        end

        it 'may not index participants for camp' do
          camp = Fabricate(:event, groups: [group])
          is_expected.not_to be_able_to(:index_participations, camp)
        end
      end
    end
  end
end
