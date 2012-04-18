# encoding: utf-8

class BoardEngine::CommentsController < ApplicationController
	before_filter :is_from_engine

  def create
  	@comment = BoardEngine::Comment.new params[:comment]
  	@comment.user_id = current_user.id
    
    if @comment.save
    	article = @comment.commentable
    	redirect_to article_path(article.board.title, article), notice: '댓글을 저장했습니다.'
    else
    	redirect_to article_path(article.board.title, article), notice: '댓글을 저장했습니다.'
    end
  end
  
  def destroy
    @comment = BoardEngine::Comment.find params[:id]
    @comment.destroy
    article = @comment.commentable
    redirect_to article_path(article.board.title, article), :notice => "댓글을 삭제했습니다."
  end


	private

	def is_from_engine
		@is_from_engine = true
	end
end