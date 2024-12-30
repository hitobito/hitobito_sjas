class AddInsuranceFieldsToPerson < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :bank_account, :string
    add_column :people, :insurance_company, :string
    add_column :people, :insurance_number, :string
  end
end
