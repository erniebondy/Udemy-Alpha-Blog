class ArticlesController < ApplicationController

  def show
    ## 'params' is the data from the URL
    ## '@' denotes an instance variable
    ## user debugger to add a break point and start debuging
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    ## This can be used for debugging purposes
    ##render plain: params[:article]

    ## Using 'require' and 'permit' are security features
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])

    # if @article.save
    #   flash[:notice] = "Article was created successfully!"
    #   redirect_to articles_path
    # else
    #   render "edit"
    # end

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully!"
      #redirect_to @article
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end