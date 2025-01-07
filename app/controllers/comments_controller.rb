class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)

    @comment.author = "Anônimo" if @comment.author.blank?

    if @comment.save
      redirect_to @post, notice: 'O seu comentário foi enviado.'
    else
      render 'posts/show'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :body, :post_id)
  end
end
