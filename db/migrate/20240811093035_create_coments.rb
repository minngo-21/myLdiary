class CreateComents < ActiveRecord::Migration[6.1]
  def change
    create_table :coments do |t|
      t.string :coment_name
      t.string :grade
      t.text :about
      t.integer :time

      t.timestamps
    end
  end
end
