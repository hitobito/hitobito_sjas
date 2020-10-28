# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


namespace :app do
  namespace :license do
    task :config do
      @licenser = Licenser.new('hitobito_sjas',
                               'Stiftung für junge Auslandssschweizer',
                               'https://github.com/hitobito/hitobito_sjas')
    end
  end
end
