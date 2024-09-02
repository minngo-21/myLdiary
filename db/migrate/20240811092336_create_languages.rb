class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :post_name
      t.string :grade
      t.text :about
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
