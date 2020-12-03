class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.string   :nickname,    null:false 
      t.text     :profile,     null:false
      t.integer  :category_id, null:false
      t.string   :area,        null:false
      t.integer  :time_id,     null:false
      t.integer  :price,       null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
