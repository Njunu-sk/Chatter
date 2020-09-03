class CommentsController < ApplicationController
  include CableReady::Broadcaster
  def index
    @comments = Comment.order(created_at: :desc).limit(10)
  end

  def create
   comment =  Comment.create(comment_params)
    cable_ready["feed"].insert_adjacent_html(
      selector: "#feed",
      position: "afterbegin",
      html: render_to_string(partial: "comments/comment", locals: {comment: comment})
    )
    cable_ready.broadcast
    redirect_to comments_path
  end

  private
  def comment_params
    params.permit(:body)
  end

end
