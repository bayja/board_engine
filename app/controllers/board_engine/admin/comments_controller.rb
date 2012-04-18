# encoding: utf-8

class BoardEngine::Admin::CommentsController < BoardEngine::Admin::AdminsController
	def index
		@comments = BoardEngine::Comment.order("created_at DESC").page(params[:page]).per(15)
	end

	def destroy
		@comment = BoardEngine::Comment.find params[:id]
		@comment.destroy
		redirect_to request.referer || admin_comments_path
	end
end