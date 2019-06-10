class SubcategoriesController < ApplicationController
  def index
    @subcategories = Category.find(params[:id]).subcategories.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:notice] = "Subcategory #{@subcategory.title} has been added to #{Category.find(@subcategory.category_id).title} category"
      redirect_to root_path
    end
  end

  private
  def subcategory_params
    params.require(:subcategory).permit(:category_id, :title, :description)
  end
end
