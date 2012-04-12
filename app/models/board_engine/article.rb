# encoding: utf-8

module BoardEngine
  class Article < ActiveRecord::Base
    attr_accessible :title, :body
    belongs_to :board
    
  end
end
