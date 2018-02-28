class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.belongs_to :sub, foreign_key: true

      t.timestamps
    end
  end
end
