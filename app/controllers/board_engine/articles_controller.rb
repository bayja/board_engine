#encoding: utf-8

class BoardEngine::ArticlesController < ApplicationController
	before_filter :is_from_engine
	before_filter :find_board

	def index
		@articles = @board.articles.order("created_at DESC").page(params[:page]).per(15)
	end

	def show
		@article = BoardEngine::Article.find params[:id]
	end

	def new
		@article = BoardEngine::Article.new
		@article.board_id = @board.id
	end

	def edit
		@article = @board.articles.find params[:id]
	end

	def create
		@article = @board.articles.build params[:article]
		if @article.save
			redirect_to article_path(@board.title, @article)
		else
			render :action => "new"
		end
	end

	def update
		@article = @board.articles.find params[:id]
		if @article.update_attributes params[:article]
			redirect_to article_path(@board.title, @article)
		else
			render :action => "edit"
		end
	end

	def destroy
		@article = @board.articles.where(id: params[:id]).first
		@article.destroy
		redirect_to articles_path(@board.title)
	end


	private

	def find_board
		@board = BoardEngine::Board.find_by_title(params[:board_title])
	end

	def is_from_engine
		@is_from_engine = true
	end
end