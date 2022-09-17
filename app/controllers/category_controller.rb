class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category  = Category.find(params[:id])
  end

  def new 
    @category  = Category.new
  end


  def create
    @category = Category.new(category_params)    
    @category.user_id = 1
    
    if @category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   food = Food.find(params[:id])
  #   food.destroy
  #   redirect_to foods_path
  # end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end
