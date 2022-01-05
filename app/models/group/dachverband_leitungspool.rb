# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

# Leitungspool
#     Hauptlagerleiter*in: []
#     Kursleiter*in: []
#     Leiter*in: []
#     Koch*Köchin: []
#     Zivildienstleistender: []
class Group::DachverbandLeitungspool < ::Group
  class Lagerleitung < ::Role::Leitung
  end

  class Kursleitung < ::Role::Leitung
  end

  class Mitleitung < ::Role::Leitung
  end

  class Koch < ::Role::Leitung
  end

  class Zivildienstleistender < ::Role::Leitung
  end

  roles Lagerleitung, Kursleitung, Mitleitung, Koch, Zivildienstleistender
end
