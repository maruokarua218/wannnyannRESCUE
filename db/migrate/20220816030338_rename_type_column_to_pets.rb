class RenameTypeColumnToPets < ActiveRecord::Migration[6.0]
  def change
    rename_column :pets, :type, :animal_type
  end
end
