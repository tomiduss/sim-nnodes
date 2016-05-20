class CreateCasinos < ActiveRecord::Migration
  def change
    create_table :casinos do |t|
      t.string :name
      t.datetime :last_start
      t.datetime :last_stop
      t.integer :money

      t.timestamps null: false
    end
  end
end
