# encoding: utf-8

module BoardEngine
  class Comment < ActiveRecord::Base
	  belongs_to :user
	  belongs_to :article
	  belongs_to :commentable, :polymorphic => true
	  
	  validates :body, :user_id, :presence => true
	  validates :body, :length => { :maximum => 400 }
  end
end
