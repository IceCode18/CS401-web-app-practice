class AddPublicizedToCoupons < ActiveRecord::Migration[6.0]
  def change
    add_column :coupons, :publicized, :boolean
  end
end
