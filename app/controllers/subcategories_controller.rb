class SubcategoriesController < ApplicationController
  include ApplicationHelper
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  before_action :is_user_admin?, only: [:new, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @subcategories = Category.find(params[:id]).subcategories.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      # flash[:notice] = "Subcategory #{@subcategory.title} has been added to #{Category.find(@subcategory.category_id).title} category"
      redirect_to edit_category_path(@subcategory.category_id)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @subcategory.update(subcategory_params)
      flash[:notice] = "Subcategory #{@subcategory.title} has been added to #{Category.find(@subcategory.category_id).title} category"
      redirect_to edit_category_path(@subcategory.category_id)
    else
      render 'new'
    end
  end

  def destroy
    @subcategory.destroy
    redirect_to root_path
  end

  private
  def subcategory_params
    params.require(:subcategory).permit(:category_id, :title, :description)
  end

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end
end
