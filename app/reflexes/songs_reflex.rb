# frozen_string_literal: true

class SongsReflex < ApplicationReflex
  include CableReady::Broadcaster
  include ActionView::RecordIdentifier

 def upvote
  song = Song.find(element.dataset[:id])
  song.increment! :upvote
  cable_ready["feed"].text_content(
    selector: "##{dom_id(song, "upvote")}",
    text: song.upvote
  )
  cable_ready.broadcast
 end

 def downvote
  song = Song.find(element.dataset[:id])
  song.increment! :downvote
  cable_ready["feed"].text_content(
    selector: "##{dom_id(song, "downvote")}",
    text: song.downvote
  )
  cable_ready.broadcast
 end
end
