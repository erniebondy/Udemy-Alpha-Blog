class ArticlesController < ApplicationController

  ## Peform this before any methods
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  ## Ensure user is logged in
  before_action :require_user, except: [:show, :index]

  ## Ensure user is current session user
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def show
    ## 'params' is the data from the URL
    ## '@' denotes an instance variable
    ## user debugger to add a break point and start debuging
    #@article = Article.find(params[:id])
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def create
    ## This can be used for debugging purposes
    ##render plain: params[:article]

    ## Using 'require' and 'permit' are security features
    @article = Article.new(article_params)
    @article.user = current_user
    
    if @article.save
      #render plain: @article.inspect

      ## notice OR alert
      flash[:notice] = "Article was created successfully!"

      ## Redirect to the newly created article page

      ## Short-hand
      ## redirect_to articles_path @article
      ## redirect_to articles_path #article_path(@article)
      
      redirect_to articles_path
    else
      ## Article save failed, re-render the 'new' page
      render "new"
    end
  end

  def edit
    #@article = Article.find(params[:id])

    # if @article.save
    #   flash[:notice] = "Article was created successfully!"
    #   redirect_to articles_path
    # else
    #   render "edit"
    # end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully!"
      #redirect_to @article
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  ## Only available to this controller below
  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    ## .require is used to check if the top level key is present in params,
    ## if key is not present .require throws an error

    ## .permit method is used to specify the list of allowed or 
    ## permitted attributes for a given parameter.Any attributes 
    ## not explicitly permitted will be filtered out, providing 
    ## an additional layer of security
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if @article.user != current_user
      flash[:alert] = "You can only edit of delete your own article!"
      redirect_to @article #article_path
    end
  end

end