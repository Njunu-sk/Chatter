class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :upvote, null: false, default: 0
      t.integer :downvote, null: false, default: 0
      

      t.timestamps
    end
  end
end
