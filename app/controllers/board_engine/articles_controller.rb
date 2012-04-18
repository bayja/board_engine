#encoding: utf-8

class BoardEngine::ArticlesController < ApplicationController
	before_filter :is_from_engine
	before_filter :find_board
	before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
	before_filter(:only => [:update, :destroy]) do |c|
		@article = BoardEngine::Article.find params[:id]
		c.send(:require_owner, @article)
	end

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
		@article.user_id = current_user.id
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

	# customize template path (AbstractController::Rendering#_process_options)
	def _process_options(options)
		options[:prefixes] << "board_engine/#{@board.title.pluralize}" #main app에서 view customize용
		options[:prefixes] << "board_engine/articles/type_#{@board.board_type}" #board_engine에서 board_type별로 template render
	end
end