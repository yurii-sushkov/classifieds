class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
    @categories = Category.all.collect { |category| [category.title, category.id] }
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @categories = Category.all.collect { |category| [category.title, category.id] }
    if @advertisement.save
      flash[:notice] = 'A new advertisement has been created!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show; end

  def edit
    @categories = Category.all.collect { |category| [category.title, category.id] }
  end

  def update
    @categories = Category.all.collect { |category| [category.title, category.id] }
    if @advertisement.update(advertisement_params)
      flash[:notice] = 'A new advertisement has been updated!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    flash[:notice] = 'Advertisement has been destroyed'
    @advertisement.destroy
    redirect_to root_path
  end

  private
  def advertisement_params
    params.require(:advertisement).permit(:category_id, :user_id, :title, :text).merge(user_id: current_user.id)
  end

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end
end
