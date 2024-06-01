class CreatePoohs < ActiveRecord::Migration[6.1]
  def change
    create_table :poohs do |t|
      t.string :energy
      t.string :protein
      t.string :lipid
      t.string :carbo
      t.string :salt
      t.text :effect
      t.text :treat
      t.text :recipe
      t.string :image
      t.integer :user_id
      t.string :food_name
      t.string :gi_value

      t.timestamps
    end
  end
end
