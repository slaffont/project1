class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_url
      t.string :article_url
      t.string :article_title
      t.integer :game_id

      t.timestamps
    end
  end
end
