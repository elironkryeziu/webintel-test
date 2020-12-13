class LikesController < ApplicationController
    before_action :find_article
    before_action :authenticate_user!
    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @like = @article.likes.create(user_id: current_user.id)
            @like.is_dislike = params[:is_dislike]
            @like.save
        end
        redirect_to article_path(@article)
    end
    private
    def find_article
        @article = Article.find(params[:article_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, article_id:
        params[:article_id]).exists?
      end
end
