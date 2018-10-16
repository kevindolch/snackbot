class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :url
      t.string :name
      t.float :price
      t.references :list, foreign_key: true, index: true
    end
  end
end
