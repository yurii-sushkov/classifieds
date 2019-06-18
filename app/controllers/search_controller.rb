class SearchController < ApplicationController

  def index
    @advertisements = Advertisement.search(params[:search])
  end

end
