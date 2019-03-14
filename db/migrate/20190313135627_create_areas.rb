class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :zipcode
      t.string :prefcode
      t.string :adress1
      t.string :adress2
      t.string :address3
      t.string :kana1
      t.string :kana2
      t.string :kana3
      t.text :introduce

      t.timestamps
    end
  end
end
