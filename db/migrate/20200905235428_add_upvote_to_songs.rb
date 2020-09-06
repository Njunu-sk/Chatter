class AddUpvoteToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :upvote, :integer, default: 0, null: false
  end
end
