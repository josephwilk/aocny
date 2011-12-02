class CreateWant < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.string :email
      t.integer :workshop_id
    end
  end
end
