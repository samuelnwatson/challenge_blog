class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :article, index: true, foreign_key: true
      t.references :poster, index: true

      t.timestamps null: false
    end

    add_foreign_key :comments, :users, column: :poster_id
  end
end
