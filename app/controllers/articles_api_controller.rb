class ArticlesApiController < ApplicationControllerApiController
    def index
       @articles = Article.all
     # @articles = Article.where(user_id: logged_in_user.id)
      render json: @articles
    end
  end