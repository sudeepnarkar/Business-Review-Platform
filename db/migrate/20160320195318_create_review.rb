class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer    'stars'
      t.text       'description'
      t.references 'user'
      t.references 'business'
      t.datetime   'create_date'
    end
  end
end
