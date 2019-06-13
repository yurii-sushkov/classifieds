class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update]

  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
    @subcategories = Category.all.collect { |category| [category.title, category.subcategories.collect { |v| [v.title, v.id] } ] }
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @subcategories = Category.all.collect { |category| [category.title, category.subcategories.collect { |v| [v.title, v.id] } ] }
    if @advertisement.save
      flash[:notice] = "A new advertisement has been created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @advertisement.save
      flash[:notice] = "A new advertisement has been created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def advertisement_params
    params.require(:advertisement).permit(:subcategory_id, :user_id, :title, :text).merge(user_id: current_user.id)
  end

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end
end
