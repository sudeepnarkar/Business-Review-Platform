class CreateDistance < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.references :user, index: true, foreign_key: true
      t.references :business, index: true, foreign_key: true
      t.float :dist
    end
  end
end
