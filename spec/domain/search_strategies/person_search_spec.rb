#  Copyright (c) 2012-2024, Stiftung für junge Auslandschweizer. This file is part of
#  hitobito_sjas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sjas.

require "spec_helper"

describe SearchStrategies::PersonSearch do
  before do
    people(:leader).update!(bank_account: "Account 123", insurance_company: "Company 123", insurance_number: 999)
  end

  describe "#search_fulltext" do
    let(:user) { people(:admin) }

    it "finds accessible person by bank account" do
      result = search_class(people(:leader).bank_account).search_fulltext
      expect(result).to include(people(:leader))
    end

    it "finds accessible person by insurance company" do
      result = search_class(people(:leader).insurance_company).search_fulltext
      expect(result).to include(people(:leader))
    end

    it "finds accessible person by insurance number" do
      result = search_class(people(:leader).insurance_number.to_s).search_fulltext
      expect(result).to include(people(:leader))
    end
  end

  def search_class(term = nil, page = nil)
    described_class.new(user, term, page)
  end
end