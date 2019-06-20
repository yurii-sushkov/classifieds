class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

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

  def edit
    @subcategories = Category.all.collect { |category| [category.title, category.subcategories.collect { |v| [v.title, v.id] } ] }
  end

  def update
    @subcategories = Category.all.collect { |category| [category.title, category.subcategories.collect { |v| [v.title, v.id] } ] }
    if @advertisement.update(advertisement_params)
      flash[:notice] = "A new advertisement has been created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @advertisement.destroy
    redirect_to root_path
  end

  private
  def advertisement_params
    params.require(:advertisement).permit(:subcategory_id, :user_id, :title, :text).merge(user_id: current_user.id)
  end

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end
end
