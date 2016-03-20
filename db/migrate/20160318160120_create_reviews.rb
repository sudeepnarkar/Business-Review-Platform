class CreateReviews < ActiveRecord::Migration
  def up
    create_table :reviews do |t|
      t.integer    'stars'
      t.text       'description'
      t.references 'user_stub'
      t.references 'business'
    end
  end
  
  def down
    drop_table 'reviews'
  end
end
