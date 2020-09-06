class AddDownvoteToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :downvote, :integer ,default: 0, null: false
  end
end
