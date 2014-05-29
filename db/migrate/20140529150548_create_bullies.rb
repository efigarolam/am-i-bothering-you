class CreateBullies < ActiveRecord::Migration
  def change
    create_table :bullies do |t|
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
