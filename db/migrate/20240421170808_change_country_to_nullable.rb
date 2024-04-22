class ChangeCountryToNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :country, true
  end
end
