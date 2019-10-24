class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.string :code_expiry
      t.string :claimer
      t.text :note
      t.integer :coupon_id

      t.timestamps
    end
  end
end
