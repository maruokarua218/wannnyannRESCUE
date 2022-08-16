class ChangeDataGenderToPet < ActiveRecord::Migration[6.0]
  def change
    change_column :pets, :gender, :integer, using: 'gender::integer', default: 1
  end
end
