# encoding: utf-8

class BoardEngine::Admin::BoardsController < BoardEngine::Admin::AdminsController
	def index
		@boards = BoardEngine::Board.all
	end
end