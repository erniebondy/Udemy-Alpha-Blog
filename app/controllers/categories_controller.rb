class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created!"
      redirect_to @category ## Show page
    else
      render "new"
    end
  end

  def index
    #render categories_path
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  ## This ensures that the params object contains a key called "category".
  ## If it doesn’t, Rails will raise an ActionController::ParameterMissing error.
  ## This whitelists only the :name attribute inside the category parameters.
  ## Anything else (description, etc.) is discarded, so users can’t inject 
  ## unexpected data into your model.
  def category_params
    params.require(:category).permit(:name)
  end

end