class PagesController < ApplicationController
  layout 'pages'
  def index
    @song = Song.all
  end
end
