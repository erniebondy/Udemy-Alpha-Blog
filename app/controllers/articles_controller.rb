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

end