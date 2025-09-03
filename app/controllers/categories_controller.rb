class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show]

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
    @categories = Category.paginate(page: params[:page], per_page: 3)
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

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "You must be an admin user to perfom that action!"
      redirect_to categories_path
    end
  end

end