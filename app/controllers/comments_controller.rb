class CommentsController < ApplicationController
  before_action :authenticate_user!
  include CableReady::Broadcaster
  def index
    @comments = Comment.order(created_at: :desc).limit(10)
  end

  def create
    @song = Song.find(params[:song_id])
    comment = @song.comments.create(comment_params)
    cable_ready["feed"].insert_adjacent_html(
      selector: "#feed",
      position: "afterbegin",
      html: render_to_string(partial: "songs/comment", locals: {comment: comment})
    )
    cable_ready.broadcast
    redirect_to song_path(song_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(song_id: song_id, user_id: current_user.id)
  end

  def song_id
    params[:song_id]
  end

end
