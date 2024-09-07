class AddUrlaToLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :languages, :urla, :text
  end
end
