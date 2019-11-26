class RenameChangedToIsChanged < ActiveRecord::Migration[6.0]
  def change
    rename_column :coupons, :changed, :isChanged
  end
end
