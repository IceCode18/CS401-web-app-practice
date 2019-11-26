class AddChangeTypeToCoupons < ActiveRecord::Migration[6.0]
  def change
    add_column :coupons, :changeType, :string
  end
end
