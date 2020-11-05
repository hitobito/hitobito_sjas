# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


# Stiftungsrat
#     Präsident\*in[]
#     Vize-Präsident\*in[]
#     Kassier\*in[]
#     Sekretär\*in[]
#     Beisitzer\*in[]
class Group::DachverbandStiftungsrat < ::Group
  class Praesident < ::Role
  end
  class Vizepraesident < ::Role
  end
  class Kassier < ::Role
  end
  class Sekretaer < ::Role
  end
  class Beisitzer < ::Role
  end

  roles Praesident, Vizepraesident, Kassier, Sekretaer, Beisitzer
end
