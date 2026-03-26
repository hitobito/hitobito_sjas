# frozen_string_literal: true

#  Copyright (c) 2012-2020, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.


Rails.application.routes.draw do

  extend LanguageRouteScope

  language_scope do
    # Define wagon routes here

    resources :groups do
      resources :events, only: [] do # do not redefine events actions, only add new ones
        collection do
          get 'camp' => 'events#index', type: 'Event::Camp'
          scope module: "events", only: [:new, :create] do
            resources :filters, path: "camp/filters", as: "events_camp_filters", type: "Event::Camp"
          end
        end
      end
    end

    get 'list_camps' => 'event/lists#camps', as: :list_camps
  end

end
