class AddChangedToCoupons < ActiveRecord::Migration[6.0]
  def change
    add_column :coupons, :changed, :boolean
  end
end
