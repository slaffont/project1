class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :status
      t.text :comment
      t.string :article_url
      t.string :article_title
      t.integer :user_id

      t.timestamps
    end
  end
end
