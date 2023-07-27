class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.commentable = current_reader
    # binding.pry
    # redirect_to article_path(@article)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article), notice: "comment was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
