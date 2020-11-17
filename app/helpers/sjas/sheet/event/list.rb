# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::Sheet::Event::List
  extend ActiveSupport::Concern

  included do
    alias_method_chain :render_left_nav, :camps
  end

  def render_left_nav_with_camps
    if view.nav_left == 'camps'
      view.render 'nav_left_events'
    else
      render_left_nav_without_camps
    end
  end

end
