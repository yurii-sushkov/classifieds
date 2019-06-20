class CategoriesController < ApplicationController
  include ApplicationHelper
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :is_user_admin?, only: [:new, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @categories = Category.all
    @row_counter = 0
  end

  def new
    @category = Category.new
  end

  def show; end

  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category #{@category.title} has been created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category #{@category.title} has been updated!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
