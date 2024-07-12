# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

class Group::DachverbandStiftungsrat < ::Group
  class Praesident < ::Role
    self.permissions = [:group_full]
  end

  class Vizepraesident < ::Role
    self.permissions = [:group_full]
  end

  class Kassier < ::Role
    self.permissions = [:group_read]
  end

  class Sekretaer < ::Role
    self.permissions = [:group_full]
  end

  class Beisitzer < ::Role
    self.permissions = [:group_read]
  end

  roles Praesident, Vizepraesident, Kassier, Sekretaer, Beisitzer
end
