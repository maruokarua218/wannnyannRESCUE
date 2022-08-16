class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.text :image
      t.string :gender
      t.string :type
      t.integer :prefectures_name
      t.text :content

      t.timestamps
    end
  end
end
