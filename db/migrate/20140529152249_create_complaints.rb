class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :bully_id
      t.string :message

      t.timestamps
    end
  end
end
