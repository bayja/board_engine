# encoding: utf-8

class BoardEngine::Admin::AdminsController < Admin::AdminsController
	before_filter :is_from_engine

	def is_from_engine
		@is_from_engine = true		
	end	
end