# frozen_string_literal: true

#  Copyright (c) 2012-2021, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

module Sjas::Group
  # Define additional used attributes
  # self.used_attributes += [:website, :bank_account, :description]
  # self.superior_attributes = [:bank_account]
  ::Group.root_types(::Group::Dachverband)

  def name
    return super if I18n.locale == :de
    return super unless one_of_a_kind?

    i18n_key = "activerecord.models.#{self.class.name.underscore}"

    I18n.t("#{i18n_key}.name", default: nil).presence ||
      I18n.t("#{i18n_key}.one")
  end

  private

  def one_of_a_kind?
    potentially_unique_types = %w[
      Group::Dachverband
      Group::DachverbandGeschaeftsstelle
      Group::DachverbandLeitungspool
      Group::DachverbandTeilnehmerpool
      Group::DachverbandStiftungsrat
      Group::DachverbandStiftung
    ]

    potentially_unique_types.include?(type) &&
      self.class.where(type: type).one?
  end
end
