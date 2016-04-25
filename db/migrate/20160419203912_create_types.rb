class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.references :business, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
