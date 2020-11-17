# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandssschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::Event::ListsController
  extend ActiveSupport::Concern

  included do
    skip_authorize_resource only: [:camps]
  end

  def camps
    authorize!(:list_available, Event::Camp)

    @grouped_events = grouped(upcoming_user_camps)
    render :events
  end

  private

  def upcoming_user_camps
    upcoming_user_events.where(type: Event::Camp.sti_name)
  end
end
