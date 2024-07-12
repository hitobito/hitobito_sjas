# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

# Geschäftsstelle
#     Admin[]
#     Adressverwalter\*in[]
#     Projektleitung[]
#     Sachbearbeitung[]
#     Geschäftsführung[]
class Group::DachverbandGeschaeftsstelle < ::Group
  class Adressverwalter < ::Role::Adressverwalter
    self.permissions += [:layer_and_below_full]
  end

  class Projektleitung < ::Role
    self.permissions = [:layer_and_below_full, :contact_data, :finance]
  end

  class Sachbearbeitung < ::Role
    self.permissions = [:layer_and_below_full, :finance]
  end

  class Geschaeftsfuehrung < ::Role
    self.permissions = [:layer_and_below_full, :finance]
  end

  roles Adressverwalter, Projektleitung, Sachbearbeitung, Geschaeftsfuehrung
end
