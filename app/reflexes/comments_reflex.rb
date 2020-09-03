# frozen_string_literal: true

class CommentsReflex < ApplicationReflex
  include CableReady::Broadcaster
  include ActionView::RecordIdentifier

 def upvote
  comment = Comment.find(element.dataset[:id])
  comment.increment! :upvote
  cable_ready["feed"].text_content(
    selector: "##{dom_id(comment, "upvote")}",
    text: comment.upvote
  )
  cable_ready.broadcast
 end

 def downvote
  comment = Comment.find(element.dataset[:id])
  comment.increment! :downvote
  cable_ready["feed"].text_content(
    selector: "##{dom_id(comment, "downvote")}",
    text: comment.downvote
  )
  cable_ready.broadcast
 end
end
