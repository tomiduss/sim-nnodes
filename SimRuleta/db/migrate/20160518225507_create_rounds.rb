class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :number
      t.integer :number_total
      t.datetime :date
      
      t.timestamps null: false
    end
  end
end
