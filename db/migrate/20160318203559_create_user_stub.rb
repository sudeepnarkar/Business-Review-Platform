class CreateUserStub < ActiveRecord::Migration
  def change
    create_table :user_stubs do |t|
      t.string 'username'
    end
  end
end
