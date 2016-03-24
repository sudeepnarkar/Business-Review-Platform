class CreateBusiness < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string 'name'
    end
  end
end
