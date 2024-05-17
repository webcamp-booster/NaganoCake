class RenameLastNameKaneColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :last_name_kane, :last_name_kana
  end
end
