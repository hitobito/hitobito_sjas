# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


Group::Dachverband.seed_once(:parent_id, :short_name,
  parent_id: nil,
  name: 'Stiftung für junge Auslandschweizer',
  short_name: 'SJAS'
)
