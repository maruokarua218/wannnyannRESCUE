class AddClientToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :client, :boolean, default: false
  end
end
