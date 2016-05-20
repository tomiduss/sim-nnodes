class AddApiKeyToCasino < ActiveRecord::Migration
  def change
    add_column :casinos, :api_key, :string
  end
end
