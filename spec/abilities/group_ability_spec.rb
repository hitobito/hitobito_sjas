# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

require 'spec_helper'

describe GroupAbility do

  subject { ability }
  let(:ability) { Ability.new(role.person.reload) }

  context 'layer and below full' do
    let(:role) { Fabricate(Group::DachverbandGeschaeftsstelle::Adressverwalter.name.to_sym, group: groups(:geschaeftsstelle)) }

    context 'in same layer' do
      let(:group) { groups(:root) }

      it 'may show camps' do
        is_expected.to be_able_to(:'index_event/camps', group)
      end

      it 'may export camps' do
        is_expected.to be_able_to(:'export_event/camps', group)
      end

    end
  end

  context 'group read' do
    let(:role) { Fabricate(Group::DachverbandStiftungsrat::Praesident.name.to_sym, group: groups(:stiftungsrat)) }

    context 'in other group on same layer' do
      let(:group) { groups(:root) }

      it 'may show camps' do
        is_expected.to be_able_to(:'index_event/camps', group)
      end

      it 'may export camps' do
        is_expected.not_to be_able_to(:'export_event/camps', group)
      end

    end
  end

  context 'group full' do
    let(:role) { Fabricate(Group::Kantonalkomitee::Adressverwalter.name.to_sym, group: groups(:ag_so)) }

    context 'in other group from other layer' do
      let(:group) { groups(:root) }

      it 'may show camps' do
        is_expected.to be_able_to(:'index_event/camps', group)
      end

      it 'may not export camps' do
        is_expected.not_to be_able_to(:'export_event/camps', group)
      end
    end
  end

end
