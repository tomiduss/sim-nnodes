class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :number
      t.datetime :date

      t.integer :casino_id

      t.timestamps null: false
    end
  end
end
