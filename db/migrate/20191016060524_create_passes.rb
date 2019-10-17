class CreatePasses < ActiveRecord::Migration[6.0]
  def change
    create_table :passes do |t|
      t.string :from
      t.string :code
      t.datetime :expiry
      t.integer :code_id
      t.timestamps
    end
  end
end
