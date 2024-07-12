# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

# DachverbandStiftung
#     Kontakte[]
class Group::DachverbandStiftung < ::Group
  class Kontakt < ::Role::Kontakt
  end

  roles Kontakt
end
