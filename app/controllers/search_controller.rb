class SearchController < ApplicationController

  def index
    @advertisements = Advertisement.search(params[:search])
    @search_by_user = false
  end

  def show
    @advertisements = Advertisement.where(:user_id => params[:id])
    @search_by_user = true
  end

end
