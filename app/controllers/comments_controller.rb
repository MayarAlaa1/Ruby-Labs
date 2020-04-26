class CommentsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!,except: [:create]
    # http_basic_authenticate_with name: "mayar", password: "secret", only: :destroy

    def create
        authorize! :create,@comment
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
       
        redirect_to article_path(@article)
    end
     
    def destroy
        authorize! :destroy,@comment
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
