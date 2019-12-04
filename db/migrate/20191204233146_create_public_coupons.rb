class CreatePublicCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :public_coupons do |t|
      t.string :pub_id
      t.string :from
      t.string :site
      t.string :code
      t.datetime :expiry
      t.string :claimer
      t.string :note

      t.timestamps
    end
  end
end
