class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brand
      t.string :photo_url
      t.string :price
      t.string :type
      t.string :notes

      t.timestamps
    end
  end
end
